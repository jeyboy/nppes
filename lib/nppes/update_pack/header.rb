module Nppes
  module UpdatePack
    class Header < UpdatePack::Base
      class_attribute :fields

      #ALIAS = {
      #'NPI' => 'npi',
      #'Entity Type Code' => 'entity_type_code',
      #'Replacement NPI' => 'replacment_npi',
      #'Employer Identification Number (EIN)' => ''
      #
      #"Provider Organization Name (Legal Business Name)"
      #"Provider Last Name (Legal Name)"
      #"Provider First Name"
      #"Provider Middle Name"
      #"Provider Name Prefix Text"
      #"Provider Name Suffix Text"
      #"Provider Credential Text"
      #
      #"Provider Other Organization Name"
      #"Provider Other Organization Name Type Code"
      #"Provider Other Last Name"
      #"Provider Other First Name"
      #"Provider Other Middle Name"
      #"Provider Other Name Prefix Text"
      #"Provider Other Name Suffix Text"
      #"Provider Other Credential Text"
      #"Provider Other Last Name Type Code"
      #
      #"Provider First Line Business Mailing Address"
      #"Provider Second Line Business Mailing Address"
      #"Provider Business Mailing Address City Name"
      #"Provider Business Mailing Address State Name"
      #"Provider Business Mailing Address Postal Code"
      #"Provider Business Mailing Address Country Code (If outside U.S.)"
      #"Provider Business Mailing Address Telephone Number"
      #"Provider Business Mailing Address Fax Number"
      #"Provider First Line Business Practice Location Address"
      #"Provider Second Line Business Practice Location Address"
      #"Provider Business Practice Location Address City Name"
      #"Provider Business Practice Location Address State Name"
      #"Provider Business Practice Location Address Postal Code"
      #"Provider Business Practice Location Address Country Code (If outside U.S.)"
      #"Provider Business Practice Location Address Telephone Number"
      #"Provider Business Practice Location Address Fax Number"
      #"Provider Enumeration Date"	"Last Update Date"
      #
      #"NPI Deactivation Reason Code"
      #"NPI Deactivation Date"
      #"NPI Reactivation Date"
      #"Provider Gender Code"
      #
      #"Authorized Official Last Name"
      #"Authorized Official First Name"
      #"Authorized Official Middle Name"
      #"Authorized Official Title or Position"
      #"Authorized Official Telephone Number"
      #"Healthcare Provider Taxonomy Code_1"
      #
      #"Provider License Number_1"
      #"Provider License Number State Code_1"
      #"Healthcare Provider Primary Taxonomy Switch_1"
      #
      #"..."
      #
      #"Healthcare Provider Taxonomy Code_15"
      #"Provider License Number_15"
      #"Provider License Number State Code_15"
      #"Healthcare Provider Primary Taxonomy Switch_15"
      #
      #
      #
      #"Other Provider Identifier_1"
      #"Other Provider Identifier Type Code_1"
      #"Other Provider Identifier State_1"
      #"Other Provider Identifier Issuer_1"
      #
      #"Other Provider Identifier_2"
      #"Other Provider Identifier Type Code_2"
      #"Other Provider Identifier State_2"
      #"Other Provider Identifier Issuer_2"
      #
      #"..."
      #
      #
      #"Is Sole Proprietor"
      #"Is Organization Subpart"
      #"Parent Organization LBN"
      #"Parent Organization TIN"
      #"Authorized Official Name Prefix Text"
      #"Authorized Official Name Suffix Text"
      #"Authorized Official Credential Text"
      #
      #"Healthcare Provider Taxonomy Group_1"
      #"Healthcare Provider Taxonomy Group_2"
      #}

      def initialize(header_file)
        parse(header_file) do |row|
          @fields = split_row(row)
        end
      end
    end
  end
end