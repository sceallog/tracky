class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  validates :name, presence: true, length: { maximum: 70 }
  validates :role, presence: true

  has_one_attached :avatar
  belongs_to :role

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.name = provider_data.info.name
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.image = provider_data.info.image
    end
  end
end
