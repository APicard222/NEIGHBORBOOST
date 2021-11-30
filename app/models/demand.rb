class Demand < ApplicationRecord
  belongs_to :building
  belongs_to :requester, class_name: 'User', foreign_key: 'requester_id'
  belongs_to :responder, class_name: 'User', foreign_key: 'responder_id', optional: true

  validates :title, :description, :category, :start_date, :end_date, presence: true
end
