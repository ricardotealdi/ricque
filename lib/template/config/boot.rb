module Bootstrap
  APP_NAME = 'bootstrap'
  DEFAULT_ENVIRONMENT = 'development'

  def self.app_name
    APP_NAME
  end

  def self.lib_dir
    ENV["LIB_DIR_#{app_name}"]
  end

  def self.config_dir
    ENV["CONFIG_ROOT_#{app_name}"]
  end
  
  def self.root
    ENV["APP_ROOT_#{app_name}"]
  end

  def self.env
    ENV["RUBY_ENV"]
  end

  def self.groups
    ENV["BUNDLER_GROUPS"].split(',')
  end
end

ENV["APP_ROOT_#{Bootstrap.app_name}"]    = ::File.expand_path('../..', __FILE__)
ENV["CONFIG_ROOT_#{Bootstrap.app_name}"] = ::File.expand_path('config', ENV["APP_ROOT_#{Bootstrap.app_name}"])
ENV["LIB_DIR_#{Bootstrap.app_name}"]     = ::File.expand_path("lib/#{Bootstrap.app_name}", ENV["APP_ROOT_#{Bootstrap.app_name}"])

Bootstrap::DEFAULT_ENVIRONMENT = "development" unless defined?(Bootstrap::DEFAULT_ENVIRONMENT)

ENV["RUBY_ENV"]     = ENV["RUBY_ENV"] || ENV["RACK_ENV"] || Bootstrap::DEFAULT_ENVIRONMENT
ENV["RACK_ENV"]     = ENV["RUBY_ENV"]

ENV["BUNDLER_GROUPS"] = "default,#{ENV["RUBY_ENV"]}"

require 'rubygems'
require 'bundler/setup'

Bundler.require(*ENV["BUNDLER_GROUPS"].split(','))