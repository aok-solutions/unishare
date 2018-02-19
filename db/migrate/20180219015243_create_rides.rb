class CreateRides < ActiveRecord::Migration[5.1]
  def change
    create_table :rides do |t|
      t.integer :seats
      t.string :destination
      t.string :pickup
      t.datetime :departure
      t.datetime :arrival

      t.timestamps
    end
  end
end
