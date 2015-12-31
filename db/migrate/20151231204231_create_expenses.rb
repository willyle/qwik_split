class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :trip_id
      t.integer :creator_id
      t.string :title
      t.string :dscription
      t.integer :total
      t.string :status

      t.timestamps null: false
    end
  end
end
