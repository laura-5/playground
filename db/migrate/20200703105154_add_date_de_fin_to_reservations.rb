class AddDateDeFinToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :date_fin, :date
  end
end
