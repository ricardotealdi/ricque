# encoding: utf-8
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'ricque/version'

Gem::Specification.new do |s|
  s.name = 'ricque'
  s.version = Ricque::VERSION
  s.authors = ['Ricardo Tealdi']
  s.email = %w(ricardo.tealdi@gmail.com)
  s.license = 'MIT'
  s.summary = 'Ricque is a generator of Ruby applications with bootstrap ' \
    'similar to Rails\' bootstrap'

  s.description = 'Ricque is a generator of Ruby applications with bootstrap ' \
    'similar to Rails\' bootstrap'
  s.rubyforge_project = 'ricque'

  s.files = Dir.glob(
    'lib/**/*', File::FNM_DOTMATCH
  ).reject { |a| a =~ /\.{1,2}$/ }

  s.require_paths = %w(lib)

  s.add_dependency 'thor'
  s.add_dependency 'activesupport'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'simplecov-rcov'

  s.bindir = 'bin'
  s.executables = %w(ricque)
end
