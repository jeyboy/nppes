module Nppes
  module UpdatePack
    class RequiredFields
      class_attribute :fields
      class_attribute :relations
      class_attribute :code_values

      # not used at this time
      self.code_values = {
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

      self.fields = {
          npi: 0,
          npi_deactivation_reason_code: 38,
          npi_deactivation_date: 39,
          npi_reactivation_date: 40,
          entity_type_code: 1,

          last_name: [5, 42],
          first_name: [6, 43],
          middle_name: [7, 44],
          prefix: 8,
          suffix: 9,
          last_update_date: 37,
          gender_code: 41,
      }

      self.relations = {
        np_addresses:
          [
            {
                address_type: 'official',
                address1: 28,
                address2: 29,

                city: 30,
                state: 31,
                zip: 32,
                phone: [34, 46]
            },
            {
                address_type: 'mailing',
                address1: 20,
                address2: 21,

                city: 22,
                state: 23,
                zip: 24,
                phone: 26
            }
          ],

        np_licenses:
          (0..14).each_with_object([]) do |i, ret|
            ret <<
            {
                taxonomy_code: 47 + (i * 4),
                license_number: 48 + (i * 4),
                license_number_state_code: 49 + (i * 4),
                healthcare_taxonomy_switch: 50 + (i * 4)
            }
          end
      }
    end
  end
end