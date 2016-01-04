class ProfilesController < ApplicationController
  def edit
  	@user = User.find(params[:user_id])
  	@profile = @user.profile

  	if @user.id != session[:user_id]
  		flash[:alert] = "You are unable to edit another user's profile."
  		redirect_to dashboard_path
  	end
  end

  def update
  	@user = User.find(session[:user_id])

  	if @user
  		@profile = @user.profile

  		if @profile.update(profile_params)
  			flash[:notice] = "You have successfully updated your profile."
  		else
  			flash[:alert] = "There was an error while updating your profile."
  			redirect_to :back
  		end

      redirect_to user_path(@user)
    else
      redirect_to dashboard_path
    end
  end

  private
  	def profile_params
  		params.require(:profile).permit(:fname, :lname, :email, :gender, :birthday, :work)
  	end
end
