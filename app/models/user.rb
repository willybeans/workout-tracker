class User < ApplicationRecord
  has_many :workouts
  has_many :workout_goals
  has_many :workout_schedules


  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
