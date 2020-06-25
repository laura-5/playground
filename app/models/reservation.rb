class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :entreprise
  belongs_to :activite
end
