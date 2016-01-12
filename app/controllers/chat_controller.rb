class ChatController < WebsocketRails::BaseController
	def new_message
		user = User.find(session[:user_id])
		members = Trip.find(message[:trip_id]).users

		if members.include?(user) && message[:body] != ""
			id = "trip#{message[:trip_id]}"

			@message = Message.new(user_id: session[:user_id], trip_id: message[:trip_id], body: message[:body])
		
			if @message.save
				WebsocketRails[id].trigger 'broadcast', {time: "#{@message.created_at.strftime('%m/%d/%Y   %I:%M%p')}", name: "#{@message.user.profile.fname} #{@message.user.profile.lname}", body: "#{@message.body}" }
			end
		end
	end
end