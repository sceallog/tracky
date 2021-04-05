class SearchController < ApplicationController
  def search
    @projects = Project.ransack(name_cont: params[:q]).result(distinct: true)
    @tickets = Ticket.ransack(title_cont: params[:q]).result(distinct: true)

    respond_to do |format|
      format.html do
        @projects = @projects.paginate(page: params[:page], per_page: 10)
        @tickets = @tickets.paginate(page: params[:page], per_page: 10)
      end
      format.json do
        @projects
        @tickets
      end
    end
  end

  private

  def force_json
    request.format = :json
  end
end
