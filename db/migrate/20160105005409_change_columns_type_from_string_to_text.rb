class ChangeColumnsTypeFromStringToText < ActiveRecord::Migration
  def change
  	change_column :trips, :description, :text
  	change_column :messages, :body, :text

  	remove_column :expenses, :dscription
  	add_column :expenses, :description, :text
  end
end
