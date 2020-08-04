class AddJourFinToEntreprises < ActiveRecord::Migration[6.0]
  def change
    add_column :entreprises, :jour_fin, :date
  end
end
