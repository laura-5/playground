class DashboardController < ApplicationController

  def dashboard
    @activites = Activite.where(user: current_user)
    @reservations = Reservation.where(user: current_user)
  end

end
