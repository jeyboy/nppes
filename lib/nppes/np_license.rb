module Nppes
  class NpLicense < ActiveRecord::Base
    belongs_to :np_identifier
  end
end