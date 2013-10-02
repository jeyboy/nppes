require 'rails'
module Nppes
  class Railtie < Rails::Railtie
    require 'delayed_job'

    Delayed::Worker.backend = :active_record

    rake_tasks do
      load File.expand_path('../tasks/nppes.rake', __FILE__)
    end
  end
end
