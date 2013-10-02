require 'rails'
module Nppes
  class Railtie < Rails::Railtie
    rake_tasks do
      load File.expand_path('../tasks/nppes.rake', __FILE__)
    end
  end
end
