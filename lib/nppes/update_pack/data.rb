module Nppes
  module UpdatePack
    class Data < UpdatePack::Base
      def initialize(data_file)
        @file = data_file
      end

      def proceed
        parse(@file) do |row|
          proceed_row(row)
        end
      end

      def proceed_row(row, required_fields = RequiredFields)
        @fields = split_row(row)

        npi = NpIdentifier.new

        required_fields.fields.each_pair { |k, v| npi.send("#{k}=", @fields[v]) }
        required_fields.relations.each_pair do |k, v|
          v.each do |entity|
            relation = npi.send(k).new
            entity.each_pair {|name, num| relation.send("#{name}=", @fields[num])}
          end
        end

        npi.save!
      end
    end
  end
end