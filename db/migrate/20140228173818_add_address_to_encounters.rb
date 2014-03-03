class AddAddressToEncounters < ActiveRecord::Migration
  def change
    add_column :encounters, :address, :string
  end
end
