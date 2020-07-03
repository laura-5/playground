class HeureDeDebutToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :heure_debut, :time
  end
end
