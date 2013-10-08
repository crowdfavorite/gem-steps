# encoding: utf-8

require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = FileList['specs/*_spec.rb']
  t.verbose = true
end
