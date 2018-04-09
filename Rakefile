#!/usr/bin/env ruby
# Encoding: utf-8
require "bundler/gem_tasks"
task :default => :spec

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec) do |t|
    t.fail_on_error = false
  end

  task :default => :spec
rescue LoadError
  # no rspec available
end
