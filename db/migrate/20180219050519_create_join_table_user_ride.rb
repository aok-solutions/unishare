class CreateJoinTableUserRide < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :rides do |t|
      # t.index [:user_id, :ride_id]
      # t.index [:ride_id, :user_id]
    end
  end
end
