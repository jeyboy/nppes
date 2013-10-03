require 'zip'
require 'nokogiri'
require 'open-uri'

module Nppes
  module UpdatePack
    class Pack
      class << self
        def proceed(zip_file)
          zip = Zip::File.open(zip_file)

          data = zip.entries.detect {|entry| entry.name =~ /npidata_\d+-\d+\.csv/}
          #head = zip.entries.detect {|entry| entry.name =~ /npidata_\d+-\d+FileHeader\.csv/}

          raise Exception.new('head or data not found') unless data || head

          #header = UpdatePack::Header.new(head.get_input_stream)

          data = UpdatePack::Data.new(data.get_input_stream)
          data.proceed
        end

        def proceed_updates
          Nppes::NpUpdateCheck.proc_needed.each do |update|
            proceed_update(update)
          end
        end

        def background_proceed_updates
          Nppes::NpUpdateCheck.proc_needed.each do |update|
            Delayed::Job.enqueue(Nppes::Jobs::UpdaterJob.new(update))
          end
        end

        def init_base
          doc = Nokogiri::HTML(open(Nppes.updates_url))
          link = doc.css('a').detect do |link|
            link['href'] =~ Nppes.initiate_signature
          end
          raise Exception.new('Initial file not found') unless link
          proceed(prepare_file(link['href']))
        end

        def check_updates
          doc = Nokogiri::HTML(open(Nppes.updates_url))
          signature = Nppes.weekly ? Nppes.weekly_signature : Nppes.monthly_signature

          doc.css('a').each do |link|
            Nppes::NpUpdateCheck.where(file_link: link['href']).first_or_create if link['href'] =~ signature
          end

          proceed_updates
        end

        def background_check_updates(continious = false)
          Delayed::Job.enqueue(Nppes::Jobs::SearcherJob.new((Nppes.get_time_period if continious)))
        end

        def proceed_update(update)
          begin
            proceed(prepare_file(update.file_link))
          rescue
            update.update_attribute(:done, false)
          else
            update.update_attribute(:done, true)
          end
        end

        protected
          def prepare_file(file_link)
            ret_file = open(file_link)
            file = Tempfile.new(File.basename(file_link))
            file << ret_file.read.force_encoding('utf-8')
            file.flush
            file.path
          end
      end
    end
  end
end