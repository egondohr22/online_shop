class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.bigint :product_id, null: true
      t.bigint :user_id, null: false
      t.integer :quantity, default: 1
      
      t.timestamps
    end
  end
end
