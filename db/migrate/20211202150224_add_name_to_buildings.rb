class AddNameToBuildings < ActiveRecord::Migration[6.0]
  def change
    add_column :buildings, :name, :string
  end
end
