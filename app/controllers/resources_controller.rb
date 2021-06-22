class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :update, :destroy]

  # GET /resources
  def index
    @resources = Resource.all

    render json: @resources, include: [:user]
  end

  # GET /resources/1
  def show
    render json: @resource, include: [:user, :technologies]
  end

  # POST /resources
  def create
    @resource = Resource.new(resource_params)
    @resource.user = current_user
    if @resource.save
      render json: @resource, status: :created, location: @resource, include: [:user]
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /resources/1
  def update
    if @resource.update(resource_params)
      render json: @resource, include: [:user]
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /resources/1
  def destroy
    @resource.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resource_params
      params.require(:resource).permit(:title, :content, :lead)
    end
end
