#!/usr/bin/env rake
require "bundler/gem_tasks"

require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << 'lib/mp3manager'
  t.test_files = FileList['test/lib/mp3manager/*_test.rb']
  t.verbose = true
end

task :default => :test
