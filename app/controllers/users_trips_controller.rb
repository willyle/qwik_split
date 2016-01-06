class UsersTripsController < ApplicationController
  def invite
  	@trip = Trip.find(params[:trip_id])
  	users = @trip.accepted_users
  	member = false

  	if @trip
  		users.each do |user|
  			if user.id == session[:user_id]
  				member = true
  			end
  		end

  		if member
  			@profile = Profile.find_by(email: params[:email])

  			if @profile
  				@users_trip = UsersTrip.create(user_id: @profile.user.id, trip_id: @trip.id, status: "invited")
  				
  				if @users_trip.id
  					flash[:notice] = "You have added #{full_name @profile} to the trip."
  				else
  					flash[:alert] = "#{full_name @profile} has already been added to the trip."
  				end
  			else
  				flash[:alert] = "This user does not exist."
  			end
  		else
  			flash[:alert] = "You are not a member or have not accepted your invitation to this trip."
  		end
  	end
  end

  def accept
  	@users_trip = UsersTrip.find_by(user_id: session[:user_id], trip_id: params[:trip_id])

   if @users_trip
     	@users_trip.update(status: "accepted")
     	flash[:notice] = "You have successfully accepted this trip."
   else
    	flash[:alert] = "You were not invited to this trip."
   end
  end

  def destroy
  	@users_trip = UsersTrip.find_by(user_id: session[:user_id], trip_id: params[:trip_id])

   if @users_trip
   	@users_trip.destroy
   	flash[:notice] = "You have successfully declined this trip."
   else
   	flash[:alert] = "You were not invited to this trip."
   end

   respond_to do |format|
   	format.html { redirect_to trips_path }
   	format.js
   end
  end

  def full_name profile
  	profile.fname + " " + profile.lname
  end
end
