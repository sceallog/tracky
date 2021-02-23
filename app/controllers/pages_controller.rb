class PagesController < ApplicationController
  def home
    @user = current_user
    if current_user

      #Data for Ticket status chart.
      @statuses = []
      Status.find_each do |status|
        @statuses.push(status.name)
      end

      @ticket_statuses = []
      s = 1
      while s <= Status.all.count do
        @ticket_statuses.push(current_user.tickets.where(status_id: s).count)
        s += 1
      end

      # Data for Ticket priority chart.
      @priorities = []
      Priority.find_each do |priority|
        @priorities.push(priority.name)
      end

      @ticket_priorities = []
      p = 1
      while p <= Priority.all.count do
        @ticket_priorities.push(current_user.tickets.where(priority_id: p).count)
        p += 1
      end
      
      # Data for Ticket type charts.
      @types = []
      Type.find_each do |type|
        @types.push(type.name)
      end

      @ticket_types = []
      t = 1
      while t <= Type.all.count do
        @ticket_types.push(current_user.tickets.where(type_id: t).count)
        t += 1
      end

      @projects = Project.order(created_at: :asc).limit(5)
      @tickets = Ticket.order(created_at: :desc).limit(5)
    end

  end
end
