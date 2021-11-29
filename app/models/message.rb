class Message < ApplicationRecord
  belongs_to :building
  belongs_to :user

  validates :content, presence: true
end
