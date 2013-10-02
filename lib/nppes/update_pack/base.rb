require 'csv'

module Nppes
  module UpdatePack
    class Base
      class_attribute :file

      def parse(file)
        raise Exception.new('Block required') unless block_given?
        CSV.foreach(file) do |row|
          yield row
        end
      end

      def split_row(row)
        row.gsub(/\A"|"\z/, '').split(/\",\"/)
      end
    end
  end
end