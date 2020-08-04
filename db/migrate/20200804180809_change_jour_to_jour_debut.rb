class ChangeJourToJourDebut < ActiveRecord::Migration[6.0]
  def change
    rename_column :entreprises, :jour, :jour_debut
  end
end
