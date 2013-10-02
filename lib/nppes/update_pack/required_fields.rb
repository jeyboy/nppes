module Nppes
  module UpdatePack
    class RequiredFields
      class_attribute :fields
      class_attribute :relations
      class_attribute :code_values

      # not used at this time
      @code_values = {
        entity_type_code: {
            1 => 'individual',
            2 => 'organization',
            nil => nil
        },
        gender_code: {
            'M' => 'male',
            'F' => 'female',
            nil => nil
        },
        npi_deactivation_reason_code: {
          'DT' => 'death',
          'DB' => 'disbandment',
          'FR' => 'fraud',
          'OT' => 'other',
          nil => nil
        }
      }

      @fields = {
          npi: 0,
          npi_deactivation_reason_code: 38,
          npi_deactivation_date: 39,
          npi_reactivation_date: 40,
          entity_type_code: 1,

          last_name: 5,
          first_name: 6,
          middle_name: 7,
          prefix: 8,
          suffix: 9,
          last_update_date: 37,
          gender_code: 41,

          #first_business_practice_address: 28,
          #second_business_practice_address: 29,
          #
          #business_practice_city: 30,
          #business_practice_state: 31,
          #business_practice_postal_code: 32,
          #business_practice_phone: 34,
          #
          #
          #first_business_mailing_address: 20,
          #second_business_mailing_address: 21,
          #
          #business_mailing_city: 22,
          #business_mailing_state: 23,
          #business_mailing_postal_code: 24,
          #business_mailing_phone: 26,
          #
          #official_last_name: 42,
          #official_first_name: 43,
          #official_middle_name: 44,
          #official_phone: 46
      }

      @relations = {
        np_licenses:
          (0..14).each_with_object([]) do |i, ret|
            ret << [
              taxonomy_code: 47 + (i * 4),
              license_number: 48 + (i * 4),
              license_number_state_code: 49 + (i * 4),
              healhcare_taxonomy_switch: 50 + (i * 4)
            ]
          end
      }

      #class << self
      #  def proceed(header)
      #
      #  end
      #end
    end
  end
end