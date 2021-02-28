class PagesController < ApplicationController
  def home
    if current_user
      # Data for Ticket status chart.
      @statuses = Status.names_array
      @ticket_statuses = Status.ticket_count(current_user)

      # Data for Ticket priority chart.
      @priorities = Priority.names_array
      @ticket_priorities = Priority.ticket_count(current_user)
        
      # Data for Ticket type charts.
      @types = Type.names_array
      @ticket_types = Type.ticket_count(current_user)

      # Get the newest five entries of each resource for the tables on the dashboard.
      @projects = Project.order(created_at: :desc).limit(5)
      @tickets = Ticket.order(created_at: :desc).limit(5)
    end
  end
end
