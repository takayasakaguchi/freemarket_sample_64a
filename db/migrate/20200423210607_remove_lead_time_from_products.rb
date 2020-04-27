class RemoveLeadTimeFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :lead_time, :integer
  end
end
