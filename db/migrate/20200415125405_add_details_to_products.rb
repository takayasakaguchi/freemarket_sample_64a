class AddDetailsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :description, :text, null: false
    add_column :products, :brand, :string
    add_column :products, :status, :string, null: false
    add_column :products, :postage, :string, null: false
    add_column :products, :destination, :string, null: false
    add_column :products, :lead_time, :integer, null: false
    add_column :products, :size, :string
    add_column :products, :purchase, :integer
    add_column :products, :buyer_id, :integer
    add_column :products, :user_id, :integer, null: false, foreign_key: true
    add_column :products, :category_id, :integer, null: false, foreign_key: true
  end
end
