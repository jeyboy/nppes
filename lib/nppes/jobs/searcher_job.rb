module Nppes
  module Jobs
    class SearcherJob < Struct.new(:period)
      def perform
        STDOUT << "In searcher\n"
        UpdatePack::Pack.check_updates
      end

      def after(job)
        STDOUT << "extend job\n"
        STDOUT << "#{job.run_at}\n"
        job.update_attribute(:run_at, Time.now + period) if period
        STDOUT << "#{job.run_at}\n"
      end
    end
  end
end