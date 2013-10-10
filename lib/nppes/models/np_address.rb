module Nppes
  class NpAddress < ActiveRecord::Base
    belongs_to :np_identifier

    validates :city, presence: true
  end
end