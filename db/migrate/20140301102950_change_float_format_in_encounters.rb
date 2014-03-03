class ChangeFloatFormatInEncounters < ActiveRecord::Migration
  def self.up
   change_column :encounters, :longitude, :float
   change_column :encounters, :latitude, :float
  end

  def self.down
   change_column :encounters, :longitude, :integer
   change_column :encounters, :latitude, :integer
  end
end
