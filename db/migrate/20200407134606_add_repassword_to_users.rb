class AddRepasswordToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :repassword, :string
  end
end
