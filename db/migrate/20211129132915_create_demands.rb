class CreateDemands < ActiveRecord::Migration[6.0]
  def change
    create_table :demands do |t|
      t.string :title
      t.text :description
      t.string :category
      t.date :start_date
      t.date :end_date
      t.string :status
      t.references :building, null: false, foreign_key: true
      t.references :responder
      t.references :requester

      t.timestamps
    end
    add_foreign_key :demands, :users, column: :responder_id
    add_foreign_key :demands, :users, column: :requester_id
  end
end
