class AddUpdateCheckTable < ActiveRecord::Migration
  def self.up
    create_table :np_update_checks do |t|
      t.string :file_link
      t.boolean :done

      t.timestamps
    end
  end

  def self.down
    drop_table :np_update_checks
  end
end
