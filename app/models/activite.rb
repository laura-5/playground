class Activite < ApplicationRecord
  belongs_to :entreprise
  has_many :reservation
end
