class WorkoutSession < ApplicationRecord
  belongs_to :user

  validates :date, :activity, :duration, :description, presence: true
end
