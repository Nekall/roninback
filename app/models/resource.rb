class Resource < ApplicationRecord
  belongs_to :user

  has_many :resources_technologies
  has_many :technologies, through: :resources_technologies
end
