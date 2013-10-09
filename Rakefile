# encoding: utf-8
require 'bundler'
require "bundler/gem_tasks"
require 'rake/testtask'
require 'rake/clean'

CLOBBER.include 'pkg/*'
CLEAN.include 'pkg/*'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = FileList['specs/*_spec.rb']
  t.verbose = true
end

task :default => [:clobber, :build]
