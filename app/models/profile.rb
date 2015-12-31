class Profile < ActiveRecord::Base
	validates :user_id, :email,
				uniqueness: true,
				presence: true

	validates :fname, :lname,
				presence: true

	belongs_to :user
end
