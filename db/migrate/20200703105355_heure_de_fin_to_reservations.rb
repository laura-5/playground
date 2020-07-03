class HeureDeFinToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :heure_fin, :time
  end
end
