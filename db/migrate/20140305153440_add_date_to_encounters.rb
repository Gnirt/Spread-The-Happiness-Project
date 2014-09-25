class AddDateToEncounters < ActiveRecord::Migration
  def change
    add_column :encounters, :date, :date
  end
end
