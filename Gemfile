source 'https://rubygems.org'

# Specify your gem's dependencies in local_pac.gemspec
gemspec

group :test do
  gem 'rack-test', require: 'rack/test'
  gem 'rspec', require: false
  gem 'fuubar', require: false
  gem 'simplecov', require: false
  gem 'rubocop', require: false
  gem 'coveralls', require: false
end

group :development do
  gem 'awesome_print', require: false
  gem 'debugger'
  gem 'debugger-completion'
  gem 'fedux_org-stdlib', require: false
  gem 'foreman', require: false
  gem 'github-markup'
  gem 'pry'
  gem 'pry-debugger', require: false
  gem 'pry-doc', require: false
  gem 'redcarpet', require: false
  gem 'tmrb', require: false
  gem 'yard', require: false
end

gem 'rake', group: [:development, :test]
gem 'fedux_org-stdlib', group: [:development, :test]
gem 'bundler', '~> 1.3', group: [:development, :test]
gem 'erubis', group: [:development, :test]
gem 'versionomy', group: [:development, :test]
gem 'activesupport', group: [:development, :test]
