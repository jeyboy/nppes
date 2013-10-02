class AddLicenseTable < ActiveRecord::Migration
  def self.up
    create_table :np_licenses do |t|
      t.integer :np_identifier_id

      (1..15).each do |i|
        t.string   "taxonomy_code_#{i}",              :limit => 10
        t.string   "license_number_#{i}",             :limit => 10
        t.string   "license_number_state_code_#{i}",  :limit => 2
        t.string   "healthcare_taxonomy_switch_#{i}", :limit => 1
      end

      t.timestamps
    end
  end

  def self.down
    drop_table :np_licenses
  end
end
