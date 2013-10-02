module Nppes
  class NpIdentifier < ActiveRecord::Base
    has_one :np_license

    #self.table_name = 'email_templates'

  end
end