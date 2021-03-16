class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :update, :destroy]

  # GET /admins
  def index
    @admins = Admin.all

    render json: @admins
  end

  # GET /admins/1
  def show
    render json: @admin
  end

  # POST /admins
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      token = encode_token({user_id: @admin.id})
      render json: {user: @admin, status: :created, location: @admin, message: "creation success :-)"}
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

   # admin login
   def login
    @admin = Admin.find_by_email(params[:email]) || Admin.find_by_prenom(params[:prenom])

    if @admin && @admin.authenticate(params[:password])
      
      token = encode_token({user_id: @admin.id})
      render json: {admin: @admin, token: token}
      session[:current_user_id] = @admin.id
    else
      render json: {message: "Email ou mot de passe incorrect"}, status: 202
    end
    
  end

  # PATCH/PUT /admins/1
  def update
    if @admin.update(admin_params)
      render json: @admin
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admins/1
  def destroy
    @admin.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_params
      params.permit(:nom, :prenom, :password, :email, :authentication_token, :pdpadmin)
    end
end
