# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "app-core"
  s.version     = '0.0.1'
  s.authors     = ["Ricardo Tealdi"]
  s.email       = ["ricardo.tealdi@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{App core}
  s.description = %q{App core}

  s.rubyforge_project = "app-core"

  s.files         = Dir['lib/**/*'] + Dir['config/**/*'].select { |f| File.file?(f) }
  s.require_paths = ["lib", "config"]

  s.add_dependency "slogger"
  s.add_dependency "mongo_mapper"
  s.add_dependency "bson_ext"

end
