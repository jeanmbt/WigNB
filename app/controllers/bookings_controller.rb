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

  def index
    @user = current_user
    # @bookings = @user.bookings
    # get all the bookings that belong to that user
    @bookings = @user.bookings
    @past_bookings = []
    @future_bookings = []
    @bookings.each do |booking|
      if booking.end_date < Date.today
        @past_bookings << booking
      else
        @future_bookings << booking
      end
    end
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
