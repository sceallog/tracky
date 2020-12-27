class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_ticket, except: %i[new create index]

  def new
    @ticket = @project.tickets.build
    @ticket.user_id = current_user.id
  end

  def create
    @ticket = @project.tickets.build(ticket_params)
    @ticket.user_id = current_user.id
    if @ticket.save
      flash[:notice] = 'Ticket created'
      redirect_to project_ticket_path(@project, @ticket)
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
      redirect_to project_ticket_path(@project, @ticket)
    else
      render 'edit'
    end
  end

  def destroy
    @ticket.destroy
    flash[:success] = 'Ticket deleted'
    redirect_to @project
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

  def ticket_params
    params.require(:ticket).permit(:title, :description, :date_identified, :assigned_to_user_id, :related_project_id, :status_id, :priority_id, :target_resolution_date, :actual_resolution_date, :resolution_summary, :updated_by, :user_id)
  end
end
