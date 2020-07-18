class ActivitesController < ApplicationController
  before_action :set_activite, only: [:show, :edit, :update, :destroy]

  def index
    @activites = Activite.all
  # @entreprise = Entreprise.new
    if params[:query].present?
      @activites = Activite.where("nom ILIKE ?", "%#{params[:query]}%")
    else
      @activites = Activite.all
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

    @activites = Activite.where.not(latitude: nil, longitude: nil)
    @activites = Activite.geocoded
    @markers = @activites.map do |activite|
      {
      lat: activite.latitude,
      lng: activite.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { activite: activite })
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
    params.require(:activite).permit(:entreprise_id, :reference, :nom, :address, :jour, :heure, :description, :categorie, :type_activite, :prix, :formule, :latitude, :longitude)
  end
end
