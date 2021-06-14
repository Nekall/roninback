class User < ApplicationRecord

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'Privatemessaging'
  has_many :received_messages, foreign_key: 'recipient_id', class_name: 'Privatemessaging'
end
