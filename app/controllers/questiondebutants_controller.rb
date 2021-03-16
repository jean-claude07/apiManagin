class QuestiondebutantsController < ApplicationController
  before_action :set_questiondebutant, only: [:show, :update, :destroy]

  # GET /questiondebutants
  def index
    @questiondebutants = Questiondebutant.all

    render json: {questions: @questiondebutants}
  end

  def concept
    @questiondebutant = Questiondebutant.last
    @choix = @questiondebutant.choixquestiondebutants
    render json: {question: @questiondebutant, choix: @choix}
  end

  # GET /questiondebutants/1
  def show
    @reponse = @questiondebutant.reponsequestiondebutant
    render json: {question: @questiondebutant, reponse: @reponse}
  end

  # POST /questiondebutants
  def create
    @questiondebutant = Questiondebutant.new(questiondebutant_params)

    if @questiondebutant.save
      render json: @questiondebutant, status: :created, location: @questiondebutant
    else
      render json: @questiondebutant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questiondebutants/1
  def update
    if @questiondebutant.update(questiondebutant_params)
      render json: @questiondebutant
    else
      render json: @questiondebutant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questiondebutants/1
  def destroy
    @questiondebutant.destroy
    @questiondebutant.reponsequestiondebutant.delete
    @questiondebutant.choixquestiondebutants.delete                                                                                    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questiondebutant
      @questiondebutant = Questiondebutant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def questiondebutant_params
      params.permit(:question)
    end
end
