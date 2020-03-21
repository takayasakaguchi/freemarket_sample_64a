class AddFirstNameReadingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name_readind, :string
  end
end
