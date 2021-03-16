class ReponsequestiondebutantsController < ApplicationController
  before_action :set_reponsequestiondebutant, only: [:show, :update, :destroy]

  # GET /reponsequestiondebutants
  def index
    @reponsequestiondebutants = Reponsequestiondebutant.all

    render json: @reponsequestiondebutants
  end

  # GET /reponsequestiondebutants/1
  def show
    render json: @reponsequestiondebutant
  end

  # POST /reponsequestiondebutants
  def create
    @reponsequestiondebutant = Reponsequestiondebutant.new(reponsequestiondebutant_params)

    if @reponsequestiondebutant.save
      render json: @reponsequestiondebutant, status: :created, location: @reponsequestiondebutant
    else
      render json: @reponsequestiondebutant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reponsequestiondebutants/1
  def update
    if @reponsequestiondebutant.update(reponsequestiondebutant_params)
      render json: @reponsequestiondebutant
    else
      render json: @reponsequestiondebutant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reponsequestiondebutants/1
  def destroy
    @reponsequestiondebutant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reponsequestiondebutant
      @reponsequestiondebutant = Reponsequestiondebutant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reponsequestiondebutant_params
      params.permit(:reponse, :questiondebutant_id)
    end
end
