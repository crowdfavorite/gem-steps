Gem::Specification.new do |s|
  s.name        = 'cf_steps'
  s.version     = '0.9.0'
  s.license     = "Apache 2.0"
  s.date        = Time.now.utc
  s.summary     = 'Scripting output helper'
  s.description = 'A way to simplify the output of shell scripting written in ruby.  Should work appropriately for capistrano and rake tasks'
  s.authors     = ['Crowd Favorite']
  s.email       = ''
  s.files       = Dir['lib/**/*.rb']
  s.homepage    = 'http://crowdfavorite.com'
  s.add_runtime_dependency "colored"
end
