class ResourcesTechnologiesController < ApplicationController
  before_action :set_resources_technology, only: [:show, :update, :destroy]

  # GET /resources_technologies
  def index
    @resources_technologies = ResourcesTechnology.all

    render json: @resources_technologies
  end

  # GET /resources_technologies/1
  def show
    render json: @resources_technology
  end

  # POST /resources_technologies
  def create
    @resources_technology = ResourcesTechnology.new(resources_technology_params)

    if @resources_technology.save
      render json: @resources_technology, status: :created, location: @resources_technology
    else
      render json: @resources_technology.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /resources_technologies/1
  def update
    if @resources_technology.update(resources_technology_params)
      render json: @resources_technology
    else
      render json: @resources_technology.errors, status: :unprocessable_entity
    end
  end

  # DELETE /resources_technologies/1
  def destroy
    @resources_technology.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resources_technology
      @resources_technology = ResourcesTechnology.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resources_technology_params
      params.require(:resources_technology).permit(:resource_id, :technology_id)
    end
end
