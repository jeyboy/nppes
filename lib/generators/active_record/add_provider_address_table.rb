class AddProviderAddressTable < ActiveRecord::Migration
  def self.up
    create_table :np_addresses do |t|
      t.integer :np_identifier_id

      t.string :address_type
      t.string :address1
      t.string :address2

      t.string :city
      t.string :state
      t.string :zip
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :np_addresses
  end
end
