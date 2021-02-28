class Status < ApplicationRecord
  has_many :tickets
  extend Mobility
  translates :name, type: :string

  # Get statuses' names for chart labels.
  def self.names_array
    statuses = []
    self.find_each do |status|
      statuses.push(status.name)
    end
    statuses.to_s
  end

  # Count the number of tickets for each status and push them to ticket_statuses.
  def self.ticket_count(current_user)
    ticket_statuses = []
    s = 1
    while s <= self.all.count do
      ticket_statuses.push(current_user.tickets.where(status_id: s).count)
      s += 1
    end
    return ticket_statuses
  end
end
