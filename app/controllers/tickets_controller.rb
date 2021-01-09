class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[new create index]
  before_action :set_ticket, except: %i[new create index]
  before_action :get_comments, only: [:show]
  # before_action :get_developers, only: %i[new update]

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build(ticket_params)
    @ticket.user_id = current_user.id
    @ticket.submitted_by = current_user.name
    if @ticket.save
      flash[:notice] = 'Ticket created'
      redirect_to @ticket
    else
      flash[:alert] = @ticket.errors.full_messages
      render 'new'
    end
  end

  def index
    @tickets = Ticket.where('project_id = ?', @project.id)
  end

  def update
    if @ticket.update(ticket_params)
      flash[:success] = 'Ticket updated'
      redirect_to @ticket
    else
      render 'edit'
    end
  end

  def destroy
    @project = @ticket.project
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Ticket deleted' }
    end
  end

  private

  def set_project
    @project = Project.where('user_id = ?', current_user.id).find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The project you were looking for could not be found.'
    redirect_to root_path
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def get_comments
    @comments = Comment.where(ticket_id: @ticket.id).paginate(page: params[:page], per_page: 5)
  end

  # def set_developers
  #   User.where(role_id: 1).find_each do |dev|
  #     @developers =
  #   @developers = User.where('role_id = ?', Role.find_by(title: 'Developer'))
  # end

  def ticket_params
    params.require(:ticket).permit(:title, :description, :date_identified, :submitted_by, :related_project_id, :status_id, :priority_id, :target_resolution_date, :actual_resolution_date, :resolution_summary, :updated_by, :user_id)
  end
end
