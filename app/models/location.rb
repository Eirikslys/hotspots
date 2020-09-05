class Location < ApplicationRecord
  belongs_to :user
  has_many :rental
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
