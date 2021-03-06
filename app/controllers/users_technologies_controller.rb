class UsersTechnologiesController < ApplicationController
  before_action :set_users_technology, only: [:show, :update, :destroy]

  # GET /users_technologies
  def index
    @users_technologies = UsersTechnology.all

    render json: @users_technologies
  end

  # GET /users_technologies/1
  def show
    render json: @users_technology
  end

  # POST /users_technologies
  def create
    @users_technology = UsersTechnology.new(users_technology_params)

    if @users_technology.save
      render json: @users_technology, status: :created, location: @users_technology
    else
      render json: @users_technology.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users_technologies/1
  def update
    if @users_technology.update(users_technology_params)
      render json: @users_technology
    else
      render json: @users_technology.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users_technologies/1
  def destroy
    @users_technology.destroy
    render json: { message: "Suppression effectuée."}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_technology
      @users_technology = UsersTechnology.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def users_technology_params
      params.require(:users_technology).permit(:user_id, :technology_id)
    end
end
