source :rubygems

if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

gem 'slogger'

group :test do
  gem 'rspec'
  gem "simplecov"
  gem "simplecov-rcov"
end

group :development, :debug do
  gem 'ruby-debug19', :require => 'ruby-debug'
end