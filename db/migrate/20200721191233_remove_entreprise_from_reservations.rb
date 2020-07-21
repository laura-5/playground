class RemoveEntrepriseFromReservations < ActiveRecord::Migration[6.0]
  def change
    remove_reference :reservations, :entreprise, null: false, foreign_key: true
  end
end
