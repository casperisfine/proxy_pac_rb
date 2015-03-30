source 'https://rubygems.org'

# Specify your gem's dependencies in local_pac.gemspec
gemspec

group :development, :test do
  if !ENV.key?('CI') && !ENV.key?('TRAVIS')
    gem 'pry'
    gem 'pry-doc', require: false

    if RUBY_VERSION > '2.0.0'
      gem 'byebug'
      gem 'pry-byebug', require: false
    else
      gem 'debugger'
      gem 'pry-debugger'
    end
  end

  gem 'activesupport', '~> 4.0.0', require: false
  gem 'aruba', require: false
  gem 'awesome_print', require: 'ap'
  gem 'bundler', '~> 1.3', require: false
  gem 'command_exec', require: false
  gem 'coveralls', require: false
  gem 'cucumber', require: false
  gem 'erubis'
  gem 'fedux_org-stdlib', '~>0.7.25', require: false
  gem 'filegen'
  gem 'foreman', require: false
  gem 'fuubar', require: false
  gem 'github-markup'
  gem 'inch', require: false
  gem 'launchy', require: false
  gem 'license_finder'
  gem 'rack'
  gem 'rake', require: false
  gem 'redcarpet', require: false
  gem 'rspec', require: false
  gem 'rubocop', require: false
  gem 'simplecov', require: false
  gem 'sinatra', require: 'sinatra/base'
  gem 'tmrb', require: false
  gem 'travis-lint', require: false
  gem 'versionomy', require: false
  gem 'yard', require: false
  gem 'webmock', require: 'webmock/rspec'
  gem 'rack-test', require: 'rack/test'
end

group :profile do
  gem 'ruby-prof'
end

group :runtimes do
  group :therubyracer do
    gem 'therubyracer', require: 'v8'
  end

  group :therubyrhino do
    gem 'therubyrhino', require: 'rhino'
  end
end
