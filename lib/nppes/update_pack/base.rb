require 'csv'

module Nppes
  module UpdatePack
    class Base
      class_attribute :file

      def parse(file)
        raise Exception.new('Block required') unless block_given?
        file.each_with_index { |row, i| yield row unless i == 0 }
      end

      def split_row(row)
        row.gsub(/\A"|"\n?\z/, '').split(/\",\"/)
      end
    end
  end
end