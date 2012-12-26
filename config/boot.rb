ENV["APP_NAME"]     = "bootstrap"

ENV["APP_ROOT_#{ENV["APP_NAME"]}"]    = ::File.expand_path('../..', __FILE__)
ENV["CONFIG_ROOT_#{ENV["APP_NAME"]}"] = ::File.expand_path('config', ENV["APP_ROOT_#{ENV["APP_NAME"]}"])
ENV["LIB_DIR_#{ENV["APP_NAME"]}"]     = ::File.expand_path('lib/bootstrap', ENV["APP_ROOT_#{ENV["APP_NAME"]}"])

DEFAULT_ENVIRONMENT = "development"

ENV["RUBY_ENV"]     = ENV["RUBY_ENV"] || ENV["RACK_ENV"] || DEFAULT_ENVIRONMENT
ENV["RACK_ENV"]     = ENV["RUBY_ENV"]

ENV["BUNDLER_GROUPS"] = "default,#{ENV["RUBY_ENV"]}"

require 'rubygems'
require 'bundler/setup'

Bundler.require(*ENV["BUNDLER_GROUPS"].split(','))