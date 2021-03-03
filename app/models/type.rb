class Type < ApplicationRecord
  has_many :tickets
  extend Mobility
  translates :name, type: :string

  protected
  # Get types' names for chart labels.
  def self.names_array
    types = []
    self.find_each do |type|
      types.push(type.name)
    end
    types.to_s
  end

  # Count the number of tickets for each type and push them to ticket_types.
  def self.ticket_count(current_user) 
    ticket_types = []
    t = 1
    while t <= self.all.count do
      ticket_types.push(current_user.tickets.where(type_id: t).count)
      t += 1
    end
    return ticket_types
  end
end
