module Nppes
  class NpLicense < ActiveRecord::Base
    belongs_to :np_identifier

    validates :license_number, presence: true
  end
end