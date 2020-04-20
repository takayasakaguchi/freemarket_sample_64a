class RemoveMonthFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :month, :date
  end
end
