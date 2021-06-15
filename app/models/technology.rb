class Technology < ApplicationRecord
  has_many :users_technologies
  has_many :users, through: :users_technologies

  has_many :resources_technologies
  has_many :resources, through: :resources_technologies
end
