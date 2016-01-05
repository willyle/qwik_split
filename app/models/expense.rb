class Expense < ActiveRecord::Base
	validates :trip_id, :creator_id, :title, :total, :status,
				presence: true

	validates :total,
				numericality: {greater_than: 0}

	has_many :users_expenses, dependent: :destroy
	has_many :users, through: :users_expenses

	belongs_to :trip

	belongs_to :creator, class_name: "User", foreign_key: "creator_id"
end
