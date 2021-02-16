class Ticket < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :project
  belongs_to :status
  belongs_to :priority
  belongs_to :type
end
