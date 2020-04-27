class AddLeadTimeFromProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :lead_time, :string
  end
end
