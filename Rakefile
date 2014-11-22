require "bundler/gem_tasks"
begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.rspec_opts = %w(--color -f p)
  end
  task :default => :spec
rescue LoadError
  # no rspec available
end


