ENV["APP_ROOT"]     = ::File.expand_path('../..', __FILE__)
ENV["CONFIG_ROOT"]  = ::File.expand_path('config', ENV["APP_ROOT"])

DEFAULT_ENVIRONMENT = "development"

ENV["RUBY_ENV"]     = ENV["RUBY_ENV"] || ENV["RACK_ENV"] || DEFAULT_ENVIRONMENT
ENV["RACK_ENV"]     = ENV["RUBY_ENV"]

ENV["BUNDLER_GROUPS"] = "default,#{ENV["RUBY_ENV"]}"

require 'rubygems'
require 'bundler/setup'

Bundler.require(*ENV["BUNDLER_GROUPS"].split(','))

module Bootstrap
  def self.initialize!
    initializer_files = ::File.join(::File.expand_path('initializers', ENV["CONFIG_ROOT"]), '**', '*.rb')
    environment_file  = ::File.join(::File.expand_path('environments', ENV["CONFIG_ROOT"]), "#{ENV["RUBY_ENV"]}.rb")

    puts "Loading environment file"
    if File.exists?(environment_file) 
      load environment_file
    else
      puts "Environment file not found for [#{ENV["RUBY_ENV"]}]. Loading environment file for [#{DEFAULT_ENVIRONMENT}]"
      load ::File.join(::File.expand_path('environments', ENV["CONFIG_ROOT"]), "#{DEFAULT_ENVIRONMENT}.rb")
    end

    puts "Loading initializers"
    ::Dir[initializer_files].each { |it| load it }
  end
end