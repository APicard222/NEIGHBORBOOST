class AddRefMaterialInBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :material, foreign_key: true
  end
end
