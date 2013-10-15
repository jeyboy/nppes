module Nppes
  class NpIdentifier < ActiveRecord::Base
    has_many :np_licenses, dependent: :destroy
    has_many :np_addresses, dependent: :destroy

    def to_s
      "#{prefix} #{first_name} #{middle_name} #{last_name} #{suffix}"
    end

    validates :first_name, :last_name, presence: true

    def decoded_gender
      Nppes.decode_value(:gender_code, gender_code)
    end

    def decoded_entity_type
      Nppes.decode_value(:entity_type_code, entity_type_code)
    end

    def decoded_deactivation_reason
      Nppes.decode_value(:npi_deactivation_reason_code, npi_deactivation_reason_code)
    end
  end
end