class AddLongitudeToActivites < ActiveRecord::Migration[6.0]
  def change
    add_column :activites, :longitude, :float
  end
end
