class Role < ApplicationRecord
  has_many :users
  extend Mobility
  translates :title, type: :string
end
