class CreateEntreprises < ActiveRecord::Migration[6.0]
  def change
    create_table :entreprises do |t|
      t.string :nom
      t.string :adresse
      t.string :jour
      t.string :heure
      t.integer :num_siret
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
