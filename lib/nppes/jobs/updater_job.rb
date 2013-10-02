module Nppes
  module Jobs
    class UpdaterJob < Struct.new(:update)
      def perform
        UpdatePack::Pack.proceed_update(update)
      end

      def failure(job)
        update.update_attribute(:done, false)
      end
    end
  end
end