require 'bundler'
Bundler.require_env(:test)
require "spec/rake/spectask"

desc "Default: run all tests"
task :default => :spec


namespace :mongodb do
  desc "Start MongoDB for development"
  task :start do
    mkdir_p "db"
    system "mongod --dbpath db/"
  end
end

namespace :app do
  task :environment do
    require "lib/watchtower"
    Watchtower.new(File.dirname(__FILE__) + "/config/config.yml")
  end

  task :poll => :environment do
    Watchtower::Beam.poll_all
  end

  desc "Start Haystack for development"
  task :start do
    system "shotgun config.ru"
  end
end

multitask :start => [ 'mongodb:start', 'app:start' ]

desc "Run tests"
Spec::Rake::SpecTask.new do |t|
  t.spec_opts << "-c -D"
  t.pattern = "spec/**/*_spec.rb"
end
