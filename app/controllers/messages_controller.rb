class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
  end

  def show
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to @message
  end

  def message_params
    params.require(:message).permit(:text)
  end

end
