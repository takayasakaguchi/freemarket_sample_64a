class RenameFirstNameReadindColumnToFirstNameReadings < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :first_name_readind, :first_name_reading
  end
end
