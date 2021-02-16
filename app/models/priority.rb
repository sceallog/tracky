class Priority < ApplicationRecord
  has_many :tickets
  extend Mobility
  translates :name, type: :string
end
