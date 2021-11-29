class Building < ApplicationRecord
  has_many :users, :documents, :demands, :materials, :messages

  validates :code, uniqueness: true, presence: true
end
