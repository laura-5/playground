class Activite < ApplicationRecord
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :entreprise
  has_many :reservation
  has_many :reviews, dependent: :destroy
end
