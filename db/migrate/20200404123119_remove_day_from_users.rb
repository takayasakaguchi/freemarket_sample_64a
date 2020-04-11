class RemoveDayFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :day, :date
  end
end
