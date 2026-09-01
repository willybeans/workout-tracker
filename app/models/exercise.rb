class Exercise < ApplicationRecord
  belongs_to :workout

  validates :name, presence: true
  validates :duration_seconds, presence: true
end
