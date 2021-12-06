class Material < ApplicationRecord
  belongs_to :building
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :title, :description, presence: true
end
