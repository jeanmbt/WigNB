class DashboardsController < ApplicationController
  def show
    @user = current_user
    @wigs = @user.wigs
    authorize @wigs
  end
end
