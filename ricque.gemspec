# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'ricque'

Gem::Specification.new do |s|
  s.name        = "ricque"
  s.version     = Ricque::VERSION
  s.authors     = ["Ricardo Tealdi"]
  s.email       = ["ricardo.tealdi@gmail.com"]
  s.license     = 'MIT'
  s.summary     = %q{Ricque is a generator of Ruby applications with bootstrap similar to Rails' bootstrap}
  s.description = %q{Ricque is a generator of Ruby applications with bootstrap similar to Rails' bootstrap}

  s.rubyforge_project = "ricque"

  s.files         = Dir.glob('lib/**/*', File::FNM_DOTMATCH).reject { |a| a =~ /\.{1,2}$/}
  s.require_paths = ["lib"]

  s.add_runtime_dependency "activesupport", ">=0.6.1"

  s.bindir      = 'bin'
  s.executables = ['ricque']
end