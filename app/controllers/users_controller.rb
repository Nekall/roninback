class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:update, :destroy]

  def index
    @users = User.all
    render json: @users, include: [:technologies]
  end

  def show
    @user = User.find(params[:id])
    render json: @user, include: [:badges, :technologies, :resources]
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: @user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end

 private

  def user_params
    params.require(:user).permit(:email, :password, :firstname, :lastname, :username, :is_mentor)
  end

end
