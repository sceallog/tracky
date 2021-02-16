class PagesController < ApplicationController
  def home
    if current_user
      @status_names = []
      Status.find_each do |status|
        @status_names.push(status.name)
      end
      @open_tickets = current_user.tickets.where(status_id: 1).count
      @progress_tickets = current_user.tickets.where(status_id: 2).count
      @resolved_tickets = current_user.tickets.where(status_id: 3).count
      @tickets = [@open_tickets, @progress_tickets, @resolved_tickets]
    end

    respond_to do |format|
      format.html
      format.json { render json: @open_tickets }
    end
  end
end
