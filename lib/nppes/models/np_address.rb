module Nppes
  class NpAddress < ActiveRecord::Base
    belongs_to :np_identifier

    validates :city, presence: true

    def decoded_country
      Nppes.decode_value(:country, country)
    end

    def decoded_state
      Nppes.decode_value(:state, state)
    end

    def to_s
      "#{address1} | #{city}, #{decoded_state}, #{decoded_country}, #{zip}, #{phone}"
    end
  end
end