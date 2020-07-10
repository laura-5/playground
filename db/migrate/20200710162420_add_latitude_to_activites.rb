class AddLatitudeToActivites < ActiveRecord::Migration[6.0]
  def change
    add_column :activites, :latitude, :float
  end
end
