class ActivitesController < ApplicationController
  before_action :set_activite, only: [:show, :edit, :update, :destroy]

  def index
    @activites = Activite.all
    @entreprise = Entreprise.new
  end

  def new
    @activite = Activite.new
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
    params.require(:activite).permit(:entreprise_id, :reference, :nom, :adresse, :jour, :heure, :description, :categorie, :type_activite, :prix, :formule)
  end
end
