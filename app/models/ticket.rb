class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :status
  belongs_to :priority
end
