class Document < ApplicationRecord
  belongs_to :building
  belongs_to :user
end
