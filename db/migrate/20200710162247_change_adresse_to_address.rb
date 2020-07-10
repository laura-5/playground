class ChangeAdresseToAddress < ActiveRecord::Migration[6.0]
  def change
    rename_column :activites, :adresse, :address
  end
end
