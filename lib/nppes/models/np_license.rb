module Nppes
  class NpLicense < ActiveRecord::Base
    belongs_to :np_identifier

    validates :license_number, presence: true

    def decoded_state
      Nppes.decode_value(:state, license_number_state_code)
    end

    def decoded_speciality
      Nppes.decode_value(:taxonomy_code, taxonomy_code)
    end
  end
end