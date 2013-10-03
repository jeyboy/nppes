module Nppes
  module Jobs
    class SearcherJob < Struct.new(:period)
      def perform
        UpdatePack::Pack.check_updates
      end
      # not tested
      def reschedule_at(time, attempts)
        Nppes.logger.warn 'Rescheduling'
        time + 2.hours
      end

      def after(job)
        if period
          Nppes.logger.warn 'Create next update job'
          Delayed::Job.enqueue(Nppes::Jobs::SearcherJob.new(period), 0, Time.now + period)
        end
      end

      #def error(job, error)
      #  #self.class.messages << "error: #{error.class}"
      #end
      #
      #def failure(job)
      #  #self.class.messages << 'failure'
      #end
    end
  end
end