class RemoveColumnProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :lead_time, :integer
    remove_column :products, :destination, :string
  end
end
