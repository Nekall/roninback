class RessourcesController < ApplicationController
  before_action :set_ressource, only: [:show, :update, :destroy]

  # GET /ressources
  def index
    @ressources = Ressource.all

    render json: @ressources
  end

  # GET /ressources/1
  def show
    render json: @ressource
  end

  # POST /ressources
  def create
    @ressource = Ressource.new(ressource_params)

    if @ressource.save
      render json: @ressource, status: :created, location: @ressource
    else
      render json: @ressource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ressources/1
  def update
    if @ressource.update(ressource_params)
      render json: @ressource
    else
      render json: @ressource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ressources/1
  def destroy
    @ressource.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ressource
      @ressource = Ressource.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ressource_params
      params.require(:ressource).permit(:title, :content)
    end
end
