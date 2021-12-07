class Booking < ApplicationRecord
  belongs_to :booker, class_name: 'User', foreign_key: 'booker_id'
  belongs_to :material
end
