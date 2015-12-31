class Message < ActiveRecord::Base
	validates :trip_id, :user_id, :body,
				presence: true

	belongs_to :trip
	belongs_to :user
end
