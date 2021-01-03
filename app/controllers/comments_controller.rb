class CommentsController < ApplicationController
  before_action :set_ticket
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

  private

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :message)
  end
end
