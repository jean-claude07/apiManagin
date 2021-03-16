class ChauffeursController < ApplicationController
  before_action :set_chauffeur, only: [:show, :update, :destroy]

  # GET /chauffeurs
  def index
    @chauffeurs = Chauffeur.all.reorder('id DESC')

    render json: @chauffeurs
  end

  
  # GET /chauffeurs/1
  def show
    render json: @chauffeur
  end

  # POST /chauffeurs
  def create
    @chauffeur = Chauffeur.new(chauffeur_params)

    if @chauffeur.save
      render json: @chauffeur, status: :created, location: @chauffeur
    else
      render json: @chauffeur.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chauffeurs/1
  def update
    if @chauffeur.update(chauffeur_params)
      render json: @chauffeur
    else
      render json: @chauffeur.errors, status: :unprocessable_entity
    end
  end

  # DELETE /chauffeurs/1
  def destroy
    @chauffeur.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chauffeur
      @chauffeur = Chauffeur.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chauffeur_params
      params.permit(:photo, :permis, :cv, :contact1, :contact2, :nom, :prenom, :categorie_permis, :brith, :club, :adresse, :ville, :province, :fumeur, :alcolique, :marie, :nombre_enfant, :port_lunette, :annee_de_debut, :salaire_envisager, :disponible, :observation, :candidatprofile_id)
    end
end
