class PlusinfosController < ApplicationController
  before_action :set_plusinfo, only: [:show, :update, :destroy]

  # GET /plusinfos
  def index
    @plusinfos = Plusinfo.all

    render json: @plusinfos
  end

  # GET /plusinfos/1
  def show
    render json: @plusinfo
  end

  # POST /plusinfos
  def create
    @plusinfo = Plusinfo.create(plusinfo_params)

    if @plusinfo.save
      render json: @plusinfo, status: :created, location: @plusinfo
    else
      render json: @plusinfo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plusinfos/1
  def update
    if @plusinfo.update(plusinfo_params)
      render json: @plusinfo
    else
      render json: @plusinfo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plusinfos/1
  def destroy
    @plusinfo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plusinfo
      @plusinfo = Plusinfo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def plusinfo_params
      params.permit(:adresse, :etude, :experience, :candidatprofile_id) 
    end
end
