class AddLongitudeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :longtitude, :float
  end
end
