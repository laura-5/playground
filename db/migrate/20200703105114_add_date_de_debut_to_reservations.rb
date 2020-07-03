class AddDateDeDebutToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :date_debut, :date
  end
end
