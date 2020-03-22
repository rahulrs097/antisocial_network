class DashboardController < ApplicationController
  def show
    @dashboard_user = User.find(params[:id])
  end
end
