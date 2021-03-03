class Ticket < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :project
  belongs_to :status
  belongs_to :priority
  belongs_to :type

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :date_identified, presence: true
  validates :target_resolution_date, presence: true 
  validates :status_id, presence: true
  validates :priority_id, presence: true
  validates :type_id, presence: true
end
