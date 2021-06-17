class MessagesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_privatemessaging
  before_action do
   @privatemessaging = Privatemessaging.find(params[:privatemessaging_id])
  end

  def index
    @messages = @privatemessaging.messages
    @message = @privatemessaging.messages.new
    render json: @messages
  end

  def new
    @message = @privatemessaging.messages.new
  end

  def show
    render json: @message
  end

  def create
    @message = @privatemessaging.messages.new(message_params)

    if @message.save
      render json: @privatemessaging, status: :created, location: @privatemessaging
    else
      render json: @privatemessaging.errors, status: :unprocessable_entity
    end
  end

  private
    def set_privatemessaging
      @privatemessaging = Privatemessaging.find(params[:privatemessaging_id])
    end

    def message_params
      params.require(:message).permit(:body, :user_id)
    end
end