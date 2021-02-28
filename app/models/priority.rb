class Priority < ApplicationRecord
  has_many :tickets
  extend Mobility
  translates :name, type: :string
  
  def self.names_array 
    # Get priorities' names for chart labels.
    priorities = []
    self.find_each do |priority|
      priorities.push(priority.name)
    end
    priorities.to_s
  end

  def self.ticket_count(current_user)
    # Count the number of tickets for each priority and push them to ticket_priorities.
    ticket_priorities = []
    p = 1
    while p <= self.all.count do
      ticket_priorities.push(current_user.tickets.where(priority_id: p).count)
      p += 1
    end
    return ticket_priorities
  end
end
