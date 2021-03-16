class AnnoncesController < ApplicationController
    before_action :set_annonce, only: [:show, :update, :destroy]
  
    # GET /annonces
    def tousLeMonde
      @annonces = Annonce.all
  
      render json: @annonces
    end
  
    
    # GET /annonces/1
    def show
      render json: @annonce
    end
  
    # POST /annonces
    def create
      @annonce = Annonce.new(annonce_params)
  
      if @annonce.save
        render json: @annonce, status: :created, location: @annonce
      else
        render json: @annonce.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /annonces/1
    def update
      if @annonce.update(annonce_params)
        render json: {annonce: @annonce, message: 'modification avec successé :-)'} 
      else
        render json: @annonce.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /annonces/1
    def destroy
      @annonce.destroy
    end
  
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_annonce
      @annonce = Annonce.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def annonce_params
      params.permit(:contact, 
      :poste, :email, :reference, :etablisment, :contrat, 
      :province, :libelle, :pretention, :description, :date_limite, 
      :profil_rechercher, :annoncephoto, :recruteur_id, :client
      ) 
    end
end