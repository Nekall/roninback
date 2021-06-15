class User < ApplicationRecord
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
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
  has_many :appointment_mentor, foreign_key: 'mentor_id', class_name: 'Appointment'
  has_many :appointment_disciple, foreign_key: 'disciple_id', class_name: 'Appointment'

end
