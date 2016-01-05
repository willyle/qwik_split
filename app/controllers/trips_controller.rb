class TripsController < ApplicationController
  def index
    if session[:user_id]
      @trips = User.find(session[:user_id]).trips
    else
      redirect_to login_path
    end
  end

  def show
    @trip = Trip.find(params[:id])
    users = @trip.users
    member = false
    @expense = Expense.new
    
    users.each do |user|
      if user.id == session[:user_id]
        member = true
      end
    end

    if !member
      @trip = nil
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.creator_id = session[:user_id]

    if @trip.save
      UsersTrip.create(user_id: session[:user_id], trip_id: @trip.id, status: "accepted")
      flash[:notice] = "You have successfully added a trip."
      redirect_to trip_path(@trip)
    else
      flash[:alert] = "The title cannot be blank."
      redirect_to new_trip_path
    end
  end

  def destroy
  end

  private
    def trip_params
      params.require(:trip).permit(:title, :description)
    end
end
