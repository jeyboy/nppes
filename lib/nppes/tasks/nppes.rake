require 'rake'
require 'nppes'

namespace :nppes do
  def already_run?
    `ps aux | grep delayed_job | awk '{print $11}'`.lines.detect {|line| line == "delayed_job\n"}.present?
  end

  def has_pid?
    Dir[Rails.root.join('tmp', 'pids','delayed_job*.pid')].present?
  end

  desc 'Start background env'
  task :start_background_env do
    `cd #{Rails.root} | RAILS_ENV=#{ENV['RAILS_ENV'] || 'development'} bin/delayed_job start`
  end

  desc 'Stop background env'
  task :stop_background_env do
    `cd #{Rails.root} | RAILS_ENV=#{ENV['RAILS_ENV'] || 'development'} bin/delayed_job stop`
  end

  desc 'Run auto update'
  task :auto_update => :environment do
    Rake::Task['nppes:start_background_env'].invoke unless already_run?
    Nppes.background_update(true)
  end

  desc 'Run update once'
  task :update => :environment do
    unless already_run?
      STDOUT << "Run env ...\n"
      Rake::Task['nppes:start_background_env'].invoke
    end
    Nppes.background_update
  end
end
