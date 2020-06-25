class CreateActivites < ActiveRecord::Migration[6.0]
  def change
    create_table :activites do |t|
      t.string :nom
      t.string :heure
      t.text :description
      t.string :adresse
      t.string :jour
      t.string :categorie
      t.string :type_activite
      t.integer :prix
      t.string :formule
      t.references :entreprise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
