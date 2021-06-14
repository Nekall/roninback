class User < ApplicationRecord

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  has_many :users_badges
  has_many :badges, through: :users_badges

end
