class CreateUsersTrips < ActiveRecord::Migration
  def change
    create_table :users_trips do |t|
      t.integer :user_id
      t.integer :trip_id
      t.string :status

      t.timestamps null: false
    end
  end
end
