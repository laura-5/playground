class ReservationsController < ApplicationController


  def create
    @activite = Activite.find(params[:reservation][:activite_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.activite = @activite
    @reservation.user = current_user
    if @activite.save
      redirect_to activite_path(@activite)
    else
      render "activite/show"
    end

  end

private

  def reservation_params
    params.require(:reservation).permit(:date_debut, :date_fin, :heure_debut, :heure_fin)
  end
end
