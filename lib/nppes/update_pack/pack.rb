require 'zip'

module Nppes
  module UpdatePack
    class Pack < UpdatePack::Base
      def initialize(zip_file)
        zip = Zip::File.open(zip_file)

        data = zip.entries.detect {|entry| entry =~ /npidata_\d+-\d+\.csv/}
        head = zip.entries.detect {|entry| entry =~ /npidata_\d+-\d+FileHeader\.csv/}

        raise Exception.new('head or data not found') unless data || head

        #header = UpdatePack::Header.new(head.get_input_stream)

        data = UpdatePack::Data.new(data.get_input_stream)
        data.proceed
      end

      class << self
        def search_updates
          updates_file = nil
          url = URI.parse(Nppes.updates_url)
          res = Net::HTTP.start(url.host, url.port) {|http| http.get(url.path)}

          #doc = Hpricot.parse(res.body)
          #(doc/:a).each do |link|
          #  npi_url_expr = /[a-zA-Z\.\/:_0-9]+\/NPPES_Data[a-zA-Z\.\/_:0-9]+\.zip/
          #  updates_file = link.attributes['href'] and break unless npi_url_expr.match( link.attributes['href'] ).nil?
          #end
          #
          #updates_file_name = /NPPES_Data[a-zA-Z\.\/_:0-9]+\.zip/.match( updates_file )[0]
          #if !updates_file.blank? and !NppesUpdate.is_already_added?( updates_file_name )
          #  NppesUpdate.create( :file_url => updates_file_name )
          #end
        end
      end
    end
  end
end