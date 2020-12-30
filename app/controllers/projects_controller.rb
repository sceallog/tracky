class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, except: %i[new create index]
  before_action :set_tickets, only: %i[index]

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

  def show
    @tickets = Ticket.where('project_id = ?', @project.id)
  end

  def update
    if @project.update(project_params)
      flash[:success] = 'Project updated'
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    flash[:success] = 'Project deleted'
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_tickets
    @tickets = Ticket.all
  end

  def project_params
    params.require(:project).permit(:name, :description, :start_date, :target_end_date, :actual_end_date, :updated_by, :user_id)
  end
end
