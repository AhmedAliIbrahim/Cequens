# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new

task :console do
  require 'irb'
  require 'irb/completion'
  require 'cequens'

  ARGV.clear
  IRB.start
end
