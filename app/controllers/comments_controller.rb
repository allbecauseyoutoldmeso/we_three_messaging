class CommentsController < ApplicationController

  def create
    @message = Message.find(params[:message_id])
    @comment = @message.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to message_path(@message)
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end


end
