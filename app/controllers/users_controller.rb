class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user, include: [:badges, :technologies, :resources]
  end

  def create
    UserMailer.welcome_email(@user).deliver_now
  end  

  def update
    @user = current_user
    @user.update(user_params)
    render json: @user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end


  def user_params
    params.require(:user).permit(:email, :password, :firstname, :lastname, :username)
  end

end
