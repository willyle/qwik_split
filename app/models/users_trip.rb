class UsersTrip < ActiveRecord::Base
	validates :user_id, 
				uniqueness: {scope: :trip_id},
				presence: true

	validates :status,
				presence: true

	belongs_to :user
	belongs_to :trip
end
