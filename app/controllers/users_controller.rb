class UsersController < ApplicationController
  #before_action :authenticate_user!, only: [:index, :show]

  def index
    @users = User.all
    render json: @users
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
    params.require(:user).permit(:email, :password, :firstname, :lastname, :username)
  end

end
