class Entreprise < ApplicationRecord
  belongs_to :user
  has_many :activite
end
