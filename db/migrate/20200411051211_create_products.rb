class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :bland
      t.string :status
      t.string :postage
      t.string :destination
      t.integer :lead_time
      t.integer :price
      t.string :size
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
