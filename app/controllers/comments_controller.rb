class CommentsController < ApplicationController
  before_action :set_ticket, except: %i[destroy]
  before_action :new, only: :create

  def new
    @comment = @ticket.comments.build
  end

  def create
    @comment = @ticket.comments.build(commenter: current_user.name, message: params[:message])
    if @comment.save
      redirect_to @ticket
    else
      flash[:danger] = 'Could not create comment'
      redirect_to @ticket
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @ticket = @comment.ticket
    @comment.destroy
    redirect_to @ticket
    flash[:success] = 'Comment deleted'
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :message)
  end
end
