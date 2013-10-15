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

        npi = Nppes::NpIdentifier.where(npi: @fields[0]).first_or_initialize

        required_fields.fields.each_pair { |k, v| npi.send("#{k}=", prepare_value(@fields, v)) }

        # for submodels
        required_fields.relations.each_pair do |k, v|
          v.each do |entity|
            relation = npi.send(k).new
            entity.each_pair {|name, num| relation.send("#{name}=", prepare_value(@fields, num))}
            unless relation.valid?
              npi.send(k).delete(relation)
              break
            end
          end
        end

        npi.save if npi.valid?
      end

      protected
        def prepare_value(fields, variants)
          if variants.is_a? String
            variants
          elsif variants.is_a? Array
            variant = variants.detect {|v| fields[v].present? }
            variant ? fields[variant] : ''
          else
            fields[variants]
          end
        end
    end
  end
end