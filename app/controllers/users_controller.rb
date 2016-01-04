class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
    if (params[:password]).length > 5
      user = User.new(user_params)

      if user.save
        profile = Profile.new(profile_params)
        profile.user_id = user.id

        if profile.save
          session[:user_id] = user.id
          flash[:notice] = "You have successfully created a user account."
        else
          user.destroy
          flash[:alert] = "Please fill the form completely."
        end
      else
        flash[:alert] = "There was an error while creating a user account."
      end
    else
      flash[:alert] = "The password must be a minimum of 6 characters."
    end

    redirect_to root_path
  end

  private
    def user_params
      params.permit(:username, :password, :password_confirmation)
    end

    def profile_params
      params.permit(:fname, :lname, :email)
    end
end
