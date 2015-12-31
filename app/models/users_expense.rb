class UsersExpense < ActiveRecord::Base
	validates :user_id, 
				uniqueness: {scope: :expense_id},
				presence: true

	validates :amount,
				presence: true,
				numericality: {greater_than: 0}

	validates :status,
				presence: true

	belongs_to :user
	belongs_to :expense
end
