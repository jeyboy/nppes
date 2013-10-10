module Nppes
  class NpIdentifier < ActiveRecord::Base
    has_many :np_licenses, dependent: :destroy
    has_many :np_addresses, dependent: :destroy

    def to_s
      "#{prefix} #{first_name} #{middle_name} #{last_name} #{suffix}"
    end
  end
end