class ChangeJourDebutToBeDate < ActiveRecord::Migration[6.0]
  def change
    change_column :entreprises, :jour_debut, 'date USING CAST(jour_debut AS date)'
  end
end
