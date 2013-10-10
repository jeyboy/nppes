module Nppes
  class NpUpdateCheck < ActiveRecord::Base
    scope :failed, -> { where(done: false) }
    scope :waited, -> { where(done: nil) }
    scope :proc_needed, -> { where(done: [false, nil]) }
  end
end