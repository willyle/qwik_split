module ApplicationHelper
	def full_name user
		return user.profile.fname + " " + user.profile.lname
	end
end
