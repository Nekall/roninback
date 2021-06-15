class PrivatemessagingsController < ApplicationController
  before_action :set_privatemessaging, only: [:show, :update, :destroy]

  # GET /privatemessagings
  def index
    @users = User.all
    @privatemessagings = Privatemessaging.all

    render json: @users
    render json: @privatemessagings
  end

  # GET /privatemessagings/1
  def show
    render json: @privatemessaging
  end

  # POST /privatemessagings
  def create
    @privatemessaging = Privatemessaging.new(privatemessaging_params)

    if Privatemessaging.between(params[:sender_id], params[:recipient_id]).present?
      @Privatemessaging = Privatemessaging.between(params[:sender_id], params[:recipient_id]).first
    else
      @Privatemessaging = Privatemessaging.create!(Privatemessaging_params)
    end

    if @privatemessaging.save
      render json: @privatemessaging, status: :created, location: @privatemessaging
    else
      render json: @privatemessaging.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /privatemessagings/1
  def update
    if @privatemessaging.update(privatemessaging_params)
      render json: @privatemessaging
    else
      render json: @privatemessaging.errors, status: :unprocessable_entity
    end
  end

  # DELETE /privatemessagings/1
  def destroy
    @privatemessaging.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_privatemessaging
      @privatemessaging = Privatemessaging.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def privatemessaging_params
      params.permit(:sender_id, :recipient_id)
    end
end
