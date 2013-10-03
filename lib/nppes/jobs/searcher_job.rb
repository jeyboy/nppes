module Nppes
  module Jobs
    class SearcherJob < Struct.new(:period)
      def perform
        UpdatePack::Pack.check_updates
      end

      def after(job)
        Logger.new(File.join(Rails.root, 'log', 'delayed_job.log')).fatal period
        (job.run_at = Time.now + period) if period
        Delayed::Job.enqueue(Nppes::Jobs::SearcherJob.new(period), 0, Time.now + period) if period
      end
    end
  end
end