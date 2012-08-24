require 'appraisal'
require 'bundler/gem_tasks'

task :test do
  sh "ruby test/shoulda_let_test.rb"
end

task :default do
  sh "bundle exec rake appraisal:install && bundle exec rake appraisal test"
end
