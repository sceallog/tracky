class Project < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :start_date, presence: true
  validates :target_end_date, presence: true
end
