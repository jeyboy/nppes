require 'nppes/update_pack'
require 'nppes/models'


module EmailTemplate
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

    end

    def init(filename)

    end
  end
end
