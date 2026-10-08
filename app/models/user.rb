class User < ApplicationRecord
  has_many :workouts
  has_many :workout_goals
  has_many :workout_schedules


  has_secure_password

  validates :username, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
