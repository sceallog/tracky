class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[new create index]
  before_action :set_ticket, except: %i[new create index]
  before_action :get_comments, only: [:show]

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build(ticket_params)
    @ticket.submitted_by = current_user.name
    if @ticket.save
      flash[:notice] = t('strings.resources.created', resource: Ticket.model_name.human)
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
      flash[:success] = t('strings.resources.updated', resource: Ticket.model_name.human)
      redirect_to @ticket
    else
      render 'edit'
    end
  end

  def destroy
    @project = @ticket.project
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: t('strings.resources.deleted', resource: Ticket.model_name.human) }
    end
  end

  private

  def set_project
    @project = Project.where('user_id = ?', current_user.id).find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = t('strings.resources.not_found', resource: Project.model_name.human)
    redirect_to root_path
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def get_comments
    @comments = Comment.where(ticket_id: @ticket.id).paginate(page: params[:page], per_page: 5)
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description, :date_identified, :submitted_by, :related_project_id, :status_id, :priority_id, :type_id,
                                   :target_resolution_date, :actual_resolution_date, :resolution_summary, :updated_by, :user_id)
  end
end
