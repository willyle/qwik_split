class CreateUsersExpenses < ActiveRecord::Migration
  def change
    create_table :users_expenses do |t|
      t.integer :user_id
      t.integer :expense_id
      t.integer :amount
      t.string :status

      t.timestamps null: false
    end
  end
end
