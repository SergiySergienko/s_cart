class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.integer :product_id
      t.integer :product_qty
      t.integer :discount_amount
      t.integer :discount_operation, default: 0
      t.timestamps
    end
  end
end
