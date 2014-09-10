# encoding: utf-8
module ProxyPacRb
  class Cli
    class Validator
      private

      attr_reader :options

      public

      def initialize(options)
        @options = options
      end

      def validate
        exit_with_message 'You need to provide at least one url. Multiple urls need to be separated by a space.' if empty_url?
        exit_with_message 'You need to provide a proxy pac file.' if empty_pac_file?
      end

      private

      def empty_url?
        options.urls.blank?
      end

      def empty_pac_file?
        options.proxy_pac_file.blank?
      end

      def exit_with_message(msg)
        $stderr.puts msg
        exit 1
      end
    end

    attr_accessor :options

    def self.start(argv = ARGV)
      cli = new
      cli.parse(argv)

      Validator.new(cli.options).validate

      environment = ProxyPacRb::Environment.new(client_ip: cli.options.client_ip, time: cli.options.time)
      file = ProxyPacRb::Parser.new(environment).source(cli.options.proxy_pac_file)

      $stderr.printf("%30s: %-s\n", 'url', 'result')
      cli.options.urls.each do |u|
        begin
          $stderr.printf("%30s: %-s\n", u, file.find(u))
        rescue Exceptions::UrlInvalid
          $stderr.puts "You provide an invalid url \"#{u}\". Please use a correct one."
        end
      end
    end

    def initialize
      @options = OpenStruct.new

      @options.client_ip = IPAddr.new('127.0.0.1')
      @options.time      = Time.now
    end

    def parse(argv)
      parser = OptionParser.new do |opts|
        opts.banner = 'Usage: pprb [options] url1 [url2..urln]'

        opts.on('-c', '--client-ip IP', 'Client ip address') do |i|
          options.client_ip = IPAddr.new(i)
        end

        opts.on('-t', '--time YYYY-MM-DD HH:MM:SS', 'Time to use during lookup url') do |t|
          options.time = Time.parse(t)
        end

        opts.on('-p', '--proxy-pac FILE|URL', 'Proxy.pac-file') do |f|
          uri = Addressable::URI.parse(f)

          if uri.host.nil?
            uri.path = ::File.expand_path(uri.path)
          end

          ENV.delete 'HTTP_PROXY'
          ENV.delete 'HTTPS_PROXY'
          ENV.delete 'http_proxy'
          ENV.delete 'https_proxy'

          options.proxy_pac_file = open(uri, proxy: false).read
        end

        opts.on_tail('-h', '--help', 'Show this message') do
          $stderr.puts opts
          exit
        end

        opts.on_tail('--version', 'Show version') do
          $stderr.puts ProxyPacRb::VERSION
          exit
        end
      end

      $stderr.puts parser.help if argv.blank?

      parser.parse!(argv)
      options.urls = argv
    end
  end
end
