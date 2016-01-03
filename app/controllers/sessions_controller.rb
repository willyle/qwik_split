class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.authenticate(params[:login], params[:password])

	if @user
		session[:user_id] = @user.id
		flash[:notice] = "You have logged in successfully."
		redirect_to dashboard_path
	else
		flash[:alert] = "Your information was incorrect."
		redirect_to login_path
	end
  end

  def destroy
  	session[:user_id] = nil
   flash[:notice] = "You have signed out"
   redirect_to root_path
  end
end
