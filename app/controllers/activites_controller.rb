class ActivitesController < ApplicationController
  before_action :set_activite, only: [:show, :edit, :update, :destroy]

  def index
    @activite = Activite.all
  end

  def new
    @activite = Activite.new
  end

  def create
    @activite = Activite.new(activite_params)
    @activite.user = current_user
    if @activite.save
      redirect_to activite_path(@activite)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @activite.update(activite_params)
      redirect_to @activite
    else
      render :edit
    end
  end

  def destroy
    @activite.destroy
    redirect_to activites_path
  end

  private

  def set_entreprise
    @activite = Activite.find(params[:id])
  end

  def entreprise_params
    params.require(:activite).permit(:nom, :adresse, :jour, :heure, :num_siret)
  end
end
