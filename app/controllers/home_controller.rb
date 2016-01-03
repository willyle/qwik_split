class HomeController < ApplicationController
  def index
  	if session[:user_id]
  		redirect_to dashboard_path
  	end
  end

  def dashboard
  	if session[:user_id]
  		@user = User.find(session[:user_id])
  	else
  		redirect_to root_path
  	end
  end
end
