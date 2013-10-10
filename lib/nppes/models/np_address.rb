module Nppes
  class NpAddress < ActiveRecord::Base
    belongs_to :np_identifier

    validates :city, presence: true

    def to_s
      "#{address1} | #{city}, #{state}, #{country}, #{zip}, #{phone}"
    end
  end
end