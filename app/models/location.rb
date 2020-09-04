class Location < ApplicationRecord
  belongs_to :user
  has_many :rental
  has_one_attached :photo
end
