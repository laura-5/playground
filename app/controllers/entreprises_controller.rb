class EntreprisesController < ApplicationController
  before_action :set_entreprise, only: [:show, :edit, :update, :destroy]

  def index
    @entreprises = Entreprise.all
  end

  def new
    @entreprise = Entreprise.new
  end

  def create
    @entreprise = Entreprise.new(entreprise_params)
    @entreprise.user = current_user
    if @entreprise.save
      redirect_to entreprise_path(@entreprise)
    else
      render :new
    end
  end

  def show
    @activites = Activite.where(entreprise_id: @entreprise.id)
  end

  def edit
  end

  def update
    if @entreprise.update(entreprise_params)
      redirect_to @entreprise
    else
      render :edit
    end
  end

  def destroy
    @entreprise.destroy
    redirect_to entreprises_path
  end

  private

  def set_entreprise
    @entreprise = Entreprise.find(params[:id])
  end

  def entreprise_params
    params.require(:entreprise).permit(:nom, :adresse, :heure, :num_siret)
  end
end
