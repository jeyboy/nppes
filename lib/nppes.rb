require 'nppes/update_pack'
require 'nppes/models'
require 'nppes/jobs'
require 'nppes/railtie' if defined?(Rails)

module Nppes
  mattr_accessor :updates_url
  self.updates_url = 'http://nppes.viva-it.com/NPI_Files.html'

  mattr_accessor :weekly_signature
  self.weekly_signature = /.+\/NPPES_Data_Dissemination_\d+_\d+_Weekly\.zip/

  mattr_accessor :monthly_signature
  self.monthly_signature = /.+\/NPPES_Deactivated_NPI_Report_\d+.zip/

  mattr_accessor :weekly
  self.weekly = true

  class << self
    def setup
      yield self
    end

    def update
      UpdatePack::Pack.check_updates
    end

    def init(zip_file_name)
      UpdatePack::Pack.proceed(zip_file_name)
    end

    def has_npi?(npi)
      Nppes::NpIdentifier.where(npi: npi).present?
    end
  end
end
