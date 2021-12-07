class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    @booking.start_time = DateTime.parse(params[:start_time])
    @booking.end_time = DateTime.parse(params[:end_time])
    @booking.booker_id = current_user.id
    @booking.material_id = params[:material_id]
    @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
