class AddColumnsToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :first_name, :string, null: false
    add_column :addresses, :last_name, :string, null: false
    add_column :addresses, :first_name_reading, :string, null: false
    add_column :addresses, :last_name_reading, :string, null: false
    add_column :addresses, :postal_code, :string, null: false
    add_column :addresses, :prefecture_id, :integer, null: false
    add_column :addresses, :city, :string, null: false
    add_column :addresses, :house_number, :string, null: false
    add_column :addresses, :building_name, :string
    add_column :addresses, :phone_number, :string
    add_column :addresses, :user_id, :integer, foreign_key: true
  end
end
