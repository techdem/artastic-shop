class AddApprovedToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :approved, :boolean, default:false
  end
end
