module Nppes
  class NpIdentifier < ActiveRecord::Base
    has_many :np_licenses, dependent: :destroy
    has_many :np_addresses, dependent: :destroy
  end
end