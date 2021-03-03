class Comment < ApplicationRecord
  belongs_to :ticket

  validates :commenter, presence: true
  validates :message, presence: true, length: {maximum: 255 }
end
