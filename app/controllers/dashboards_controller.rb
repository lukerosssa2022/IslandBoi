class DashboardsController < ApplicationController
  def show
    @islands = Island.all
    @user = current_user
    @applied_bookings = current_user.bookings
    @received_bookings = current_user.received_bookings
  end
end
