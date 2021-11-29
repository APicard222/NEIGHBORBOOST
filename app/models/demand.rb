class Demand < ApplicationRecord
  belongs_to :building
  belongs_to :user

  validates :title, :description, :category, :start_date, :end_date, presence: true
end
