class RemoveRepasswordFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :repassword, :string
  end
end
