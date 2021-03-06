class Project < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :start_date, presence: true
  validates :target_end_date, presence: true


  private
  
  # Returns number of tickets with status 'open' or 0 if there are none.
  def self.open_ticket_count(id)
    project = self.find(id)
    count = project.tickets.where(status: 1).size
    count >= 1 ? count : 0
  end
end
