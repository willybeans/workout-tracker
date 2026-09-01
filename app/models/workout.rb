class Workout < ApplicationRecord
  has_many :exercises
  belongs_to :user
  belongs_to :workout_goal, optional: true
  belongs_to :workout_schedule, optional: true

  validates :name, presence: true
  validates :time, presence: true
  validates :duration_seconds, presence: true
end
