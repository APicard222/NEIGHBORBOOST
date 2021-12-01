class AddDatetoMaterial < ActiveRecord::Migration[6.0]
  def change
    add_column :materials, :start_time, :datetime
    add_column :materials, :end_time, :datetime
  end
end
