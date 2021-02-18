class Hospital < ApplicationRecord
  belongs_to :doctor
  has_one_attached :image
  has_many :reservations
end
