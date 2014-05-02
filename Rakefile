require "bundler/gem_tasks"

task :test do
  sh "bundle exec rspec spec"
end

task :doctest do
  sh "bundle exec rspec spec --format d"
end

task :default => :test