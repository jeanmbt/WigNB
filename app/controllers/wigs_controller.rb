class WigsController < ApplicationController

  skip_before_action :authenticate_user!, only: :index

  def index
    # @wigs = Wig.all
    @wigs = policy_scope(Wig).order(created_at: :desc)

    if params[:query].present?
      sql_query = "name ILIKE :query OR color ILIKE :query OR style ILIKE :query OR material ILIKE :query"
      @wigs = Wig.where(sql_query, query: "%#{params[:query]}%")
    else
      @wigs = policy_scope(Wig).order(created_at: :desc) 
    end

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
    # @wig.user = current_user
    authorize @wig
    @wig.save
    redirect_to wigs_path
  end
  
  def edit
    @wig = Wig.find(params[:id])
    # @wig.user = current_user
    authorize @wig
  end
  
  def update
    @wig = Wig.find(params[:id])
    @wig.user = current_user
    @wig.update(wig_params)
    authorize @wig

    redirect_to wig_path(@wig)
  end

  def destroy
    # Not working
    @wig = Wig.find(params[:id])
    # @wig.user = current_user
    authorize @wig
    @wig.destroy
    redirect_to wigs_path
  end
  
  private

  def wig_params
    params.require(:wig).permit(:name, :color, :description, :material, :style, :photo, :user_id, :created_at, :updated_at)
  end

end
