class Trip < ActiveRecord::Base
	validates :creator_id, :title,
				presence: true

	has_many :messages

	has_many :expenses

	has_many :users_trips
	has_many :users, through: :users_trips

	belongs_to :creator, class_name: "User", foreign_key: "creator_id"

	has_many :accepted_users, -> {
		where("status = ?", "accepted")
	}, through: :users_trips, source: :user

	has_many :invited_users, -> {
		where("status = ?", "invited")
	}, through: :users_trips, source: :user
end
