class User < ActiveRecord::Base
	attr_accessor :password

	before_create :encrypt_password

	validates :username,
				uniqueness: true,
				presence: true,
				length: {minimum: 3}

	validates :password,
				confirmation: true

	has_one :profile
	
	has_many :messages

	has_many :users_trips
	has_many :trips, through: :users_trips

	has_many :users_expenses
	has_many :expenses, through: :users_expenses

	has_many :own_trips, class_name: "Trip", foreign_key: "creator_id"

	has_many :own_expenses, class_name: "Expense", foreign_key: "creator_id"

	has_many :accepted_trips, -> {
		where("status = ?", "accepted")
	}, through: :users_trips, source: :trip

	has_many :invited_trips, -> {
		where("status = ?", "invited")
	}, through: :users_trips, source: :trip
	
	def encrypt_password
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
	end

	def self.authenticate(login, password)
		for i in 0...login.length
			if login[i] == "@"
				profile = Profile.find_by(email: login)
				
				if profile
					user = profile.user
				end
			end
		end

		if !user
			user = User.find_by(username: login)
		end

		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			return user
		else
			return nil
		end
	end
end
