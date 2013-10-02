require 'csv'

module Nppes
  module UpdatePack
    class Base
      class_attribute :file

      def parse(file)
        raise Exception.new('Block required') unless block_given?
        file.each { |row| yield row }
      end

      def split_row(row)
        row.gsub(/\A"|"\n?\z/, '').split(/\",\"/)
      end
    end
  end
end