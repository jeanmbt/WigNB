class WigsController < ApplicationController
  def index
    # @wigs = Wig.all
    @wigs = policy_scope(Wig).order(created_at: :desc)
  end

  def show
    @wig = Wig.find(params[:id])
    authorize @wig
  end
end
