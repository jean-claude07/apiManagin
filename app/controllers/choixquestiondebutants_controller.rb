class ChoixquestiondebutantsController < ApplicationController
  before_action :set_choixquestiondebutant, only: [:show, :update, :destroy]

  # GET /choixquestiondebutants
  def index
    @choixquestiondebutants = Choixquestiondebutant.all

    render json: @choixquestiondebutants
  end

  # GET /choixquestiondebutants/1
  def show
    render json: @choixquestiondebutant
  end

  # POST /choixquestiondebutants
  def create
    @choixquestiondebutant = Choixquestiondebutant.new(choixquestiondebutant_params)

    if @choixquestiondebutant.save
      render json: @choixquestiondebutant, status: :created, location: @choixquestiondebutant
    else
      render json: @choixquestiondebutant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /choixquestiondebutants/1
  def update
    if @choixquestiondebutant.update(choixquestiondebutant_params)
      render json: @choixquestiondebutant
    else
      render json: @choixquestiondebutant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /choixquestiondebutants/1
  def destroy
    @choixquestiondebutant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_choixquestiondebutant
      @choixquestiondebutant = Choixquestiondebutant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def choixquestiondebutant_params
      params.permit(:choix, :questiondebutant_id)
    end
end
