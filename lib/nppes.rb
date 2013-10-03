require 'delayed_job'
require 'nppes/models'
require 'nppes/jobs'
require 'nppes/update_pack'
require 'nppes/railtie' if defined?(Rails)

module Nppes
  mattr_accessor :updates_url
  self.updates_url = 'http://nppes.viva-it.com/NPI_Files.html'

  mattr_accessor :initiate_signature
  self.initiate_signature = /.+\/NPPES_Data_Dissemination_\w+_\d+\.zip/

  mattr_accessor :weekly_signature
  self.weekly_signature = /.+\/NPPES_Data_Dissemination_\d+_\d+_Weekly\.zip/

  mattr_accessor :monthly_signature
  self.monthly_signature = /.+\/NPPES_Deactivated_NPI_Report_\d+.zip/

  mattr_accessor :weekly
  self.weekly = true

  class << self
    def logger
      @@logger ||= Logger.new(File.join(Rails.root, 'log', 'delayed_job.log'))
    end

    def setup
      yield self
    end

    def update
      UpdatePack::Pack.check_updates
    end

    def background_update(continious = false)
      UpdatePack::Pack.background_check_updates(continious)
    end

    def init
      UpdatePack::Pack.init_base
    end

    def background_init
      UpdatePack::Pack.background_init_base
    end

    def init_by_file(zip_file_name)
      UpdatePack::Pack.proceed(zip_file_name)
    end

    def has_npi?(npi)
      Nppes::NpIdentifier.where(npi: npi).present?
    end

    def get_time_period
      weekly ? 8.days.to_i : 32.days.to_i
    end
  end
end
