class BookingsController < ApplicationController
  def create
    @wig = Wig.find(params[:wig_id])
    @booking = Booking.new(booking_params)
    @booking.wig = @wig
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to wigs_path
      flash[:notice] = "Yaaaas Queen, you just booked your wig!"
    else
      redirect_to wig_path(@wig)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
