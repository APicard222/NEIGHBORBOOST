class Material < ApplicationRecord
  belongs_to :building
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :title, :description, presence: true

  def available?
    bookings.each do |booking|
      if booking.start_time <= Date.today && booking.end_time >= Date.today
        return false
      end
    end
    return true
  end
end
