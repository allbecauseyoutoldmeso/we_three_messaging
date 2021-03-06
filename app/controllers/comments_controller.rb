class CommentsController < ApplicationController

  def create
    @message = Message.find(params[:message_id])
    @comment = @message.comments.new(comment_params)
    @comment.user = current_user
    @comment.time = Time.now
    if @comment.save
      redirect_to message_path(@message)
    end
  end

  def edit
    @message = Message.find(params[:message_id])
    @comment = @message.comments.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to message_path(@comment.message)
    else
      render 'edit'
    end
  end

  def destroy
    @message = Message.find(params[:message_id])
    @comment = @message.comments.find(params[:id])
    @comment.destroy
    redirect_to message_path(@message)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end


end
