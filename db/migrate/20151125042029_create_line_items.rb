class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :order_id
      t.integer :product_id

      t.timestamps null: false
    end
    add_index :line_items, [:order_id]
  end
end
