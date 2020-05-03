class RemoveColumnProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :destination, :string
    remove_column :products, :lead_time, :integerra
  end
end
