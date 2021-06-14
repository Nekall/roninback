class UsersBadgesController < ApplicationController
  before_action :set_users_badge, only: [:show, :update, :destroy]

  # GET /users_badges
  def index
    @users_badges = UsersBadge.all

    render json: @users_badges
  end

  # GET /users_badges/1
  def show
    render json: @users_badge
  end

  # POST /users_badges
  def create
    @users_badge = UsersBadge.new(users_badge_params)

    if @users_badge.save
      render json: @users_badge, status: :created, location: @users_badge
    else
      render json: @users_badge.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users_badges/1
  def update
    if @users_badge.update(users_badge_params)
      render json: @users_badge
    else
      render json: @users_badge.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users_badges/1
  def destroy
    @users_badge.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_badge
      @users_badge = UsersBadge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def users_badge_params
      params.require(:users_badge).permit(:user_id, :badge_id)
    end
end
