module Nppes
  module Jobs
    class SearcherJob
      def perform
        UpdatePack::Pack.check_updates
      end
    end
  end
end