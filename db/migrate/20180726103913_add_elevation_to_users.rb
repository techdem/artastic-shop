class AddElevationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :elevation, :boolean, default: false
  end
end
