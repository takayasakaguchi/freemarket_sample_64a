class AddClumnProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :lead_time, :string, null: false
    add_column :products, :prefecture_id, :integer, null: false
  end
end
