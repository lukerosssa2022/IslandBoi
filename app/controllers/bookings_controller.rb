class BookingsController < ApplicationController
  def create
    @island = Island.find(params[:island_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.island = Island.find(params[:island_id])
    @booking.status = 'pending'
    if @booking.save
      redirect_to dashboard_path, notice: "Great your booking was created"
    else
      render "islands/show"
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = params[:status]
    redirect_to dashboard_path if @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :state)
  end
end
