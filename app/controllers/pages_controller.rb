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
      @info_needed_tickets = current_user.tickets.where(status_id: 4).count
      @tickets = [@open_tickets, @progress_tickets, @resolved_tickets, @info_needed_tickets]

      @priorities = []
      Priority.find_each do |priority|
        @priorities.push(priority.name)
      end

      @no_priority = current_user.tickets.where(priority_id: 1).count
      @low_priority = current_user.tickets.where(priority_id: 2).count
      @medium_priority = current_user.tickets.where(priority_id: 3).count
      @high_priority = current_user.tickets.where(priority_id: 4).count
      @ticket_priorities = [@no_priority, @low_priority, @medium_priority, @high_priority]

      @types = []
      Type.find_each do |type|
        @types.push(type.name)
      end

      @bugs = current_user.tickets.where(type_id: 4).count
      @features = current_user.tickets.where(type_id: 5).count
      @others = current_user.tickets.where(type_id: 6).count
      @ticket_types = [@bugs, @features, @others]
    end

    respond_to do |format|
      format.html
      format.json { render json: @open_tickets }
    end
  end
end
