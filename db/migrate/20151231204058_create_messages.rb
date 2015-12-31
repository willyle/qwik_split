class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :trip_id
      t.string :body

      t.timestamps null: false
    end
  end
end
