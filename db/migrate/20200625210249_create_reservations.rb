class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :entreprise, null: false, foreign_key: true
      t.references :activite, null: false, foreign_key: true

      t.timestamps
    end
  end
end
