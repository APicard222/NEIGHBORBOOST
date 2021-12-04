class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :booker

      t.timestamps
    end
    add_foreign_key :bookings, :users, column: :booker_id
  end
end
