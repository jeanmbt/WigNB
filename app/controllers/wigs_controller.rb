class WigsController < ApplicationController

  skip_before_action :authenticate_user!, only: :index

  def index
    # @wigs = Wig.all
    @wigs = policy_scope(Wig).order(created_at: :desc) 
  end

  def show
    @wig = Wig.find(params[:id])
    @booking = Booking.new
    authorize @wig
  end

  def new
    @wig = Wig.new
    @wig.user = current_user
    authorize @wig
      end

  def create
    @wig = Wig.new(wig_params)
    @wig.user = current_user
    authorize @wig
    @wig.save
    redirect_to wigs_path
  end

  private

  def wig_params
    params.require(:wig).permit(:name, :color, :description, :material, :style, :photo, :user_id, :created_at, :updated_at)
  end

  def days_ago
    Time.now - @wig.created_at
  end

end
