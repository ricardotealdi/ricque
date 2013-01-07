require 'rubygems'
require 'active_support/inflector'
require 'fileutils'

module Ricque
  def self.root
    ::File.expand_path('../..', __FILE__)
  end

  def self.template_path
    ::File.join(root, 'lib', 'template', '.')
  end

  def self.lib_path
    ::File.join(::File.expand_path("lib/ricque", self.root), '**', '*.rb')
  end

  def self.initialize!
    load_path lib_path
  end

  private

  def self.load_path path
    files = ::Dir[path]
    files.each { |file| load file }
    nil
  end
end