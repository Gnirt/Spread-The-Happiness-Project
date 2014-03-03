class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.integer :user1_id
      t.integer :user2_id
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
    add_index :encounters, :user1_id
    add_index :encounters, :user2_id
    add_index :encounters, [:user1_id, :user2_id], unique: true
  end
end
