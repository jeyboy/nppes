require 'csv'

module Nppes
  module UpdatePack
    class Base
      def parse(file_path)
        raise Exception.new('Block required') unless block_given?
        CSV.foreach(file_path) do |row|
          yield row
        end
      end

      def split_row(row)
        row.gsub(/\A"|"\z/, '').split(/\",\"/)
      end
    end
  end
end