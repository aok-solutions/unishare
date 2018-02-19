class RidesController < ApplicationController
  before_action :set_ride, only: [:show, :edit, :update, :destroy]

  # GET /rides
  # GET /rides.json
  def index
    @rides = Ride.all
  end

  # GET /rides/1
  # GET /rides/1.json
  def show
  end

  # GET /rides/new
  def new
    @user = current_user
    unless @user.drivers_license.present?
      redirect_to rides_path, notice: 'You need a drivers license to create a ride!'
    end
    @ride = Ride.new user_id: @user.id
  end

  # GET /rides/1/edit
  def edit
    @user = @ride.user
  end

  # POST /rides
  # POST /rides.json
  def create
    @ride = Ride.new(ride_params)

    respond_to do |format|
      if @ride.save
        format.html { redirect_to @ride, notice: 'Ride was successfully created.' }
        format.json { render :show, status: :created, location: @ride }
      else
        format.html { render :new }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rides/1
  # PATCH/PUT /rides/1.json
  def update
    respond_to do |format|
      if @ride.update(ride_params)
        format.html { redirect_to @ride, notice: 'Ride was successfully updated.' }
        format.json { render :show, status: :ok, location: @ride }
      else
        format.html { render :edit }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rides/1
  # DELETE /rides/1.json
  def destroy
    @ride.destroy
    respond_to do |format|
      format.html { redirect_to rides_url, notice: 'Ride was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join_ride
    @ride = Ride.find(params[:ride])

    if @ride.available_seats > 0
      @ride.users << current_user
    else
      redirect_to rides_path, notice: 'This ride is already full'
    end

    redirect_to @ride, notice: 'You have successfully joined this ride'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ride
      @ride = Ride.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ride_params
      params.require(:ride).permit(:user_id, :seats, :destination, :pickup, :departure, :arrival)
    end
end
