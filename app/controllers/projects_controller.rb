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
      flash[:notice] = t('strings.resources.created', resource: Project.model_name.human)
      redirect_to @project
    else
      flash[:alert] = t('strings.resources.not_created', resource: Project.model_name.human)
      render 'new'
    end
  end

  def index
    @projects = current_user.projects.paginate(page: params[:page])
    @open_tickets = @tickets.where(status: 1)
  end

  def show
    @tickets = Ticket.where('project_id = ?', @project.id).paginate(page: params[:page], per_page: 5)
  end

  def update
    if @project.update(project_params)
      flash[:success] = t('strings.resources.updated', resource: Project.model_name.human)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    flash[:success] = t('strings.resources.deleted', resource: Project.model_name.human)
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
