class AddNppesTable < ActiveRecord::Migration
  def self.up
    create_table :np_identifiers do |t|

      #t.string :name
      #t.string :subject
      #t.text :body
      #t.text :classes

      t.timestamps
    end
  end

  def self.down
    drop_table :np_identifiers
  end
end
