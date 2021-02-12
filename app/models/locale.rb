class Locale < ApplicationRecord
  has_many :users
  extend Mobility
  translates :language, type: :string
end
