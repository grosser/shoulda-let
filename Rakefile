require 'bundler/setup'
require 'appraisal'
require 'bundler/gem_tasks'
require 'bump/tasks'
require 'wwtd/tasks'

task :test do
  sh "ruby test/shoulda_let_test.rb"
end

task :default => ["appraisal:gemfiles", :wwtd]
