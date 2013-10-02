#require 'email_template/j_models'
#require 'email_template/j_mailers'
#require 'email_template/j_helpers'
#
#include EmailTemplate::JModels
#include EmailTemplate::JMailers
#include EmailTemplate::Mailers::Helpers

module EmailTemplate
  mattr_accessor :updates_url
  self.updates_url = 'http://nppes.viva-it.com/NPI_Files.html'

  mattr_accessor :weekly_signature
  self.weekly_signature = /.+\/NPPES_Data_Dissemination_\d+_\d+_Weekly\.zip/

  mattr_accessor :monthly_signature
  self.monthly_signature = /.+\/NPPES_Deactivated_NPI_Report_\d+.zip/

  mattr_accessor :weekly
  self.weekly = true

  def self.setup
    yield self
  end
end
