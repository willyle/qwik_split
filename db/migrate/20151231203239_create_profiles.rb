class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :fname
      t.string :lname
      t.string :email
      t.string :gender
      t.date :birthday
      t.string :work

      t.timestamps null: false
    end
  end
end
