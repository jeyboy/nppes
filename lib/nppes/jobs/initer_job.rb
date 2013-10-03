module Nppes
  module Jobs
    class IniterJob
      def perform
        UpdatePack::Pack.init_base
      end
    end
  end
end