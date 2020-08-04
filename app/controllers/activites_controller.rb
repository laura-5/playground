class ActivitesController < ApplicationController
  before_action :set_activite, only: [:show, :edit, :update, :destroy]

  def index
    @activites = Activite.all.last(3)
  # @entreprise = Entreprise.new
    @activites = Activite.where.not(latitude: nil, longitude: nil)
    @activites = Activite.geocoded
    @markers = @activites.map do |activite|
      {
      lat: activite.latitude,
      lng: activite.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { activite: activite })
    }
    end

    if params[:query].present?
      @activites = Activite.where("address ILIKE ?", "%#{params[:query]}%")
      @activites = Activite.where("nom ILIKE ?", "%#{params[:query]}%")
    else
      @activites = Activite.all.last(3)
    end
  end

  def new
    @activite = Activite.new
    @entreprises = Entreprise.all
  end

  def create
    @entreprise = Entreprise.find(params[:activite][:entreprise_id])
    @activite = Activite.new(activite_params)
    @activite.entreprise = @entreprise
    if @activite.save
      redirect_to activite_path(@activite)
    else
      render :new
    end
  end

  def show
    @reservation = Reservation.new()

    @activite = Activite.find(params[:id])
    @reservations = Reservation.where(activite_id: @activite.id)
    @reservations_dates = @reservations.map do |reservation|
      {
        from: reservation.date_debut,
        to:   reservation.date_fin
      }
    end
  end

  def edit
    @activite = Activite.find(params[:id])
  end

  def update
    @activite.entreprise = @entreprise
    if @activite.update(activite_params)
      redirect_to activite_path(@activite, @entreprise_id)
    else
      render :edit
    end
  end

  def destroy
    @activite.destroy
    redirect_to activites_path
  end

  private

  def set_activite
    @activite = Activite.find(params[:id])
  end

  def activite_params
    params.require(:activite).permit(:entreprise_id, :reference, :nom, :address, :jour_debut, :jour_fin, :heure, :description, :categorie, :type_activite, :prix, :formule, :latitude, :longitude, photos: [])
  end
end
