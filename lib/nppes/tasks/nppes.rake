require 'rake'
require 'nppes'

namespace :nppes do
  def already_run?
    `ps aux | grep delayed_job | awk '{print $11}'`.lines.detect {|line| line == "delayed_job\n"}.present?
  end

  def has_pid?
    Dir[Rails.root.join('tmp', 'pids','delayed_job*.pid')].present?
  end

  def run_env
    unless already_run?
      STDOUT << "Run env ...\n"
      Rake::Task['nppes:start_background_env'].invoke
    end
  end

  desc 'Finish all background processes'
  task :stop_all do
    `kill -9 $(ps aux | less | grep delayed_job |  awk '{print $2}')`
    Dir[Rails.root.join('tmp', 'pids','delayed_job*.pid')].each {|file| File.delete file}
  end

  desc 'Start background env. Please specify RAILS_ENV. By default used "development" env'
  task :start_background_env do
    `cd #{Rails.root} | RAILS_ENV=#{ENV['RAILS_ENV'] || 'development'} bin/delayed_job start`
  end

  desc 'Stop background env'
  task :stop_background_env do
    `cd #{Rails.root} | RAILS_ENV=#{ENV['RAILS_ENV'] || 'development'} bin/delayed_job stop`
  end

  desc 'Run init base by info'
  task :init_base => :environment do
    run_env
    Nppes.init
  end

  desc 'Run auto update'
  task :auto_update => :environment do
    run_env
    Nppes.background_update(true)
  end

  desc 'Run update once'
  task :update => :environment do
    run_env
    Nppes.background_update
  end
end
