class Building < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :demands, dependent: :destroy
  has_many :materials, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :code, uniqueness: true, presence: true
end
