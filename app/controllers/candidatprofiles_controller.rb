class CandidatprofilesController < ApplicationController
  before_action :set_candidatprofile, only: [:show, :update, :destroy]
  before_action :filtre, only: :create

  # GET /candidatprofiles
  def index
    @candidatprofiles = Candidatprofile.all

    render json: @candidatprofiles
  end

  # GET /candidatprofiles/1
  def show
    @info = @candidatprofile.plusinfo.last
    token = encode_token({user_id: @candidatprofile.id})
    render json: {candidat: @candidatprofile, token: token, plus: @info}
  end

  #mot de passe oublier
  def forgot
    @candidatprofile = Candidatprofile.find_by_email(params[:email])

    if @candidatprofile != nil

      ChauffeurMailer.forgot(@candidatprofile).deliver_now
      
      return render json: {errors: 'email envoyer'}
      
    else
      
      render json: {errors: 'Votre email n \'existe pas :-('}
    end
  end

  # POST /candidatprofiles
  def create
    @candidatprofile = Candidatprofile.new(candidatprofile_params)

    if @candidatprofile.save
      token = encode_token({user_id: @candidatprofile.id})
      render json: {candidat: @candidatprofile, status: :created, location: @candidatprofile, token: token}
    else
      render json: @candidatprofile.errors, status: :unprocessable_entity
    end
  end

  def filtre
    @candidatprofile = Recruteur.find_by_email(params[:email])
    @candidatprofile = Candidatprofile.find_by_email(params[:email])
    if @candidatprofile
      return render json: {message: 'Email déjà utiliser dans la base de donner'}, status: 202
    end
  end

  #sessionChauffeur
  def sessionChauffeur
    @candidatprofile = Candidatprofile.find_by_email(params[:email])


    if @candidatprofile && @candidatprofile.authenticate(params[:password])
      
      token = encode_token({user_id: @candidatprofile.id})
      render json: {candidat: @candidatprofile, token: token}
      session[:current_user_id] = @candidatprofile.id
    elsif candidat = Candidatprofile.find_by_password_digest(params[:password])
      if candidat
        token = encode_token({user_id: candidat.id})
        render json: {candidat: candidat, token: token}
      end
    else
      render json: {message: "Email ou mot de passe incorrect"}, status: 202
    end
    
  end

  # PATCH/PUT /candidatprofiles/1
  def update
    if @candidatprofile.update(candidatprofile_params)
      render json: @candidatprofile
    else
      render json: @candidatprofile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /candidatprofiles/1
  def destroy
    @candidatprofile.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidatprofile
      @candidatprofile = Candidatprofile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def candidatprofile_params
      params.permit(:pdpcandidat, :nom, :prenom, :telephone, :email, :password, :string)
    end
end
