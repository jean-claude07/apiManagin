class InforecruteurController < ApplicationController
  before_action :set_inforecruteur, only: [:show, :update, :destroy]

  # GET /inforecruteur
  def index
    @inforecruteur = inforecruteur.all

    render json: @inforecruteur
  end

  # GET /inforecruteur/1
  def show
    render json: @inforecruteur
  end

  # POST /inforecruteur
  def create
    @inforecruteur = inforecruteur.new(inforecruteur_params)

    if @inforecruteur.save
      render json: @inforecruteur, status: :created, location: @inforecruteur
    else
      render json: @inforecruteur.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /inforecruteur/1
  def update
    if @inforecruteur.update(inforecruteur_params)
      render json: @inforecruteur
    else
      render json: @inforecruteur.errors, status: :unprocessable_entity
    end
  end

  # DELETE /inforecruteur/1
  def destroy
    @inforecruteur.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inforecruteur
      @inforecruteur = inforecruteur.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def inforecruteur_params
      params.permit(:adresse, :type, :details, :candidatprofile_id)
    end
end
