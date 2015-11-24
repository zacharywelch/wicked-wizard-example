class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :company
      t.string :name
      t.string :address
      t.string :sales_rep

      t.timestamps null: false
    end
  end
end
