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
    # BOOKINGS 
    @wigs_you_booked = @user.bookings
    @bookings_from_other_users_to_my_wigs = Booking.joins(:wig).where(wigs: {user: current_user}).where(confirmed: nil)
    @confirmed_bookings_from_other_users_to_my_wigs = []
    @denied_bookings_from_other_users_to_my_wigs = []
    @past_bookings_from_other_users_to_my_wigs = []

    @bookings_from_other_users_to_my_wigs.each do |booking|
      # MANAGING BOOKINGS FOR YOUR WIGS
      if booking.confirmed == true
        @confirmed_bookings_from_other_users_to_my_wigs << booking
      elsif booking.confirmed == false
        @denied_bookings_from_other_users_to_my_wigs << booking
      end

      #DISPLAY PAST WIGS YOU BOOKED
      if booking.end_date < Date.today
        @past_bookings_from_other_users_to_my_wigs << booking
      end
        
    end

    @wigs_you_booked = @user.bookings
    

    # @wigs = Wig.all
    # @bookings = @user.bookings
    # # get all the bookings that belong to that user
    # # raise
    # @renter = @bookings.wig_id.user_id
    # @past_bookings = []
    # @future_bookings = []
    # @bookings.each do |booking|
    #   if booking.end_date < Date.today
    #     @past_bookings << booking
    #   else
    #     @future_bookings << booking
    #   end
    # end
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def confirm
    @booking = Booking.find(params[:id])
    if @booking.confirmed == true
      @booking.confirmed = false
    else
      @booking.confirmed = true
    end
    
    authorize @booking
    @booking.save
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
