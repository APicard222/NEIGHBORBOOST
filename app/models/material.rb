class Material < ApplicationRecord
  belongs_to :building
  belongs_to :user

  validates :title, :description, presence: true
end
