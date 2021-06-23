class User < ApplicationRecord
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now!
  end

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  has_many :resources
  has_many :users_technologies
  has_many :technologies, through: :users_technologies
  has_many :users_badges
  has_many :badges, through: :users_badges

end
