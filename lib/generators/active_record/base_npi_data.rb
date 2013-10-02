class AddNppesTable < ActiveRecord::Migration
  def self.up
    create_table :np_identifiers do |t|
      t.integer  :npi
      t.integer  :owner_id
      t.string   :owner_type

      t.string   :npi_deactivation_reason_code,           :limit => 2
      t.date     :npi_deactivation_date
      t.date     :npi_reactivation_date

      t.string   :first_name,                            :limit => 50
      t.string   :middle_name,                           :limit => 50
      t.string   :last_name,                             :limit => 50
      t.string   :prefix,                                :limit => 5
      t.string   :suffix,                                :limit => 5

      t.string   :gender_code,                           :limit => 1
      t.string   :entity_type_code,                      :limit => 1

      t.date     :last_update_date

      t.timestamps
    end
  end

  def self.down
    drop_table :np_identifiers
  end
end
