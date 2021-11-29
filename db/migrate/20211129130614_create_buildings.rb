class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.string :code
      t.string :address

      t.timestamps
    end
  end
end
