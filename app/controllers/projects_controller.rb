class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, except: %i[new create index]
  before_action :set_tickets, only: %i[index show]

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:notice] = 'Project created'
      redirect_to project_path(@project)
    else
      flash[:alert] = 'Could not create the project'
      render 'new'
    end
  end

  def index
    @projects = current_user.projects
    @open_tickets = @tickets.where(status: 1)
  end

  def show; end

  def update; end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_tickets
    @tickets = Ticket.all
  end

  def project_params
    params.require(:project).permit(:name, :start_date, :target_end_date, :actual_end_date, :updated_by, :user_id)
  end
end
