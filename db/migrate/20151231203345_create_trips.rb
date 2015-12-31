class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :creator_id
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
