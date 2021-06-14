class Appointment < ApplicationRecord
  belongs_to :mentor, :class_name => 'User'
  belongs_to :disciple, :class_name => 'User'
end
