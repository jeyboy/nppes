class AddLicenseTable < ActiveRecord::Migration
  def self.up
    create_table :np_licenses do |t|
      t.integer :np_identifier_id

      t.string   :taxonomy_code,              :limit => 20        #http://nucc.org/index.php?option=com_wrapper&view=wrapper&Itemid=126
      t.string   :license_number,             :limit => 20
      t.string   :license_number_state_code,  :limit => 2
      t.string   :healthcare_taxonomy_switch, :limit => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :np_licenses
  end
end
