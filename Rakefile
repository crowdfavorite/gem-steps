# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "steps"
  gem.homepage = "http://github.com/crowdfavorite/gem-steps"
  gem.license = "Apache 2.0"
  gem.summary = %Q{Scripting output helper}
  gem.description = <<-EOF.gsub(/^ {4}/, '')
    A way to simplify the output of shell scripting written in ruby.

    Integrates with Capistrano and Rake tasks.
  EOF
  gem.authors = ["Crowd Favorite"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

