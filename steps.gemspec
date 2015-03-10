# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'steps/version'
require 'date'

Gem::Specification.new do |s|
  s.name        = "steps"
  s.version     = Steps::VERSION
  s.authors     = ["Crowd Favorite"]
  s.date        = Date.today.to_s
  s.summary     = %q{Ruby scripting output helper}
  s.description = %q{A way to simplify the output of shell scripting written in ruby.  Integrates with Capistrano and Rake tasks.}
  s.files       = Dir['[A-Z]*', 'steps.gemspec', 'lib/**/*', 'example.rb', 'specs/**/*']
  s.homepage    = "http://github.com/crowdfavorite/gem-steps"
  s.licenses    = ["Apache 2.0"]
  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency "colorize", ">= 0.7.5"
  s.add_dependency "highline", ">= 1.6"
  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake", "~> 10.1.0"
end

