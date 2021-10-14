class CreateOrdersProductsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :carts, :products do |t|
      t.index [:cart_id, :product_id]
      t.integer :amount, null: false, default: 0
    end
  end
end
