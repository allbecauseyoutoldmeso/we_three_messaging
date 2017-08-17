class MessagesController < ApplicationController

  def index
    @messages = Message.all
    @message = Message.new
  end

  def edit
    @message = Message.find(params[:id])
  end

  def show
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.time = Time.now
    if @message.save
      # MessageMailer.notification_email(@message.user, @message).deliver_now
      redirect_to messages_path
    else
      @messages = Message.all
      render 'index'
    end
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to messages_path
    else
      render 'edit'
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path
  end

  def message_params
    params.require(:message).permit(:text)
  end

end
