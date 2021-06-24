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

  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
   end

   def password_token_valid?
    (self.reset_password_sent_at + 4.hours) > Time.now.utc
   end

   def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    save!
   end

   private

   def generate_token
    SecureRandom.hex(10)
   end
end
