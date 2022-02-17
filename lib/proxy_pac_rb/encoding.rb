# frozen_string_literal: true
module ProxyPacRb
  # Encodes strings as UTF-8
  module Encoding
    if ''.respond_to?(:encode)
      if RUBY_ENGINE == 'jruby' || RUBY_ENGINE == 'rbx'
        # workaround for jruby bug http://jira.codehaus.org/browse/JRUBY-6588
        # workaround for rbx bug https://github.com/rubinius/rubinius/issues/1729
        def encode(string)
          if string.encoding == Encoding::BINARY
            data = string.dup
            data.force_encoding(Encoding::UTF_8)

            unless data.valid_encoding?
              raise ::Encoding::UndefinedConversionError, "Could not encode ASCII-8BIT data #{string.dump} as UTF-8"
            end
          else
            data = string.encode(Encoding::UTF_8)
          end
          data
        end
      else
        def encode(string)
          string.encode(Encoding::UTF_8)
        end
      end
    else
      # Define no-op on 1.8
      def encode(string)
        string
      end
    end
  end
end
