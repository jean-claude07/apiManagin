class RecruteursController < ApplicationController
  before_action :set_recruteur, only: [:show, :update, :destroy]
  before_action :filtre, only: :create

  # GET /recruteurs
  def index
    @recruteurs = Recruteur.all

    render json: @recruteurs
  end

  # GET /recruteurs/1
  def show
    token = encode_token({user_id: @recruteur.id})
    @annonce = @recruteur.annonces
    render json: {recruteur: @recruteur, token: token, annonce: @annonce}
  end

  def annonce
    @rien = Recruteur.annonces
    @annonce = @rien.all
    render json: @annonce
  end

  def filtre
    @recruteur = Recruteur.find_by_email(params[:email])
    # @recruteur = Candidatprofile.find_by_email(params[:email])
    if @recruteur
      return render json: {message: 'Email déjà utiliser dans la base de donner :-('}, status: 202
    end
  end

  def mdp
    @recruteur = Recruteur.find_by_email(params[:email])

    if @recruteur != nil

      RecruteurMailer.mdpo(@recruteur).deliver_now
      
      return render json: {errors: 'email envoyer :-)'}
      
    else
      
      render json: {errors: 'Votre email n \'existe pas :-('}
    end
  end

  # POST /recruteurs
  def create
    @recruteur = Recruteur.new(recruteur_params)

    if @recruteur.save
      token = encode_token({user_id: @recruteur.id})
      render json: {recruteur: @recruteur, status: :created, location: @recruteur, token: token}
    else
      render json: @recruteur.errors, status: :unprocessable_entity
    end
  end

  def sessionRecruteur
    @recruteur = Recruteur.find_by_email(params[:email]) || Recruteur.find_by_prenom(params[:prenom])

    if @recruteur && @recruteur.authenticate(params[:password])
      
      token = encode_token({user_id: @recruteur.id})
      render json: {recruteur: @recruteur, token: token}
      session[:current_user_id] = @recruteur.id
    elsif recruteur = Recruteur.find_by_password_digest(params[:password])
      if recruteur
        token = encode_token({user_id: recruteur.id})
        render json: {recruteur: recruteur, token: token}
      end
    else
      render json: {message: "Email ou mot de passe incorrect"}, status: 202
    end
    
  end

  # PATCH/PUT /recruteurs/1
  def update
    if @recruteur.update(recruteur_params)
      render json: @recruteur
    else
      render json: @recruteur.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recruteurs/1
  def destroy
    @recruteur.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recruteur
      @recruteur = Recruteur.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recruteur_params
      params.permit(:pdprecruteur, :nom, :prenom, :telephone, :entreprise, :email, :password, :other)
    end
end
