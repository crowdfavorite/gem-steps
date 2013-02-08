$:.push File.expand_path("../lib", __FILE__)
require "steps/version"

Gem::Specification.new do |s|
  s.name        = 'steps'
  s.version     = Steps::VERSION
  s.date        = '2012-02-08'
  s.summary     = 'Scripting output helper'
  s.description = 'A way to simplify the output of step based shell scripts written in ruby'
  s.authors     = ['Jonathan D. Johnson']
  s.email       = 'me@jondavidjohn.com'
  s.files       = Dir['lib/**/*.rb']
  s.homepage    = 'http://jondavidjohn.com'
  s.add_runtime_dependency "colored"
end
