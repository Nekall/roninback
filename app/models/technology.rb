class Technology < ApplicationRecord
  has_many :users_technologies
  has_many :users, through: :users_technologies
end
