class CreateOrdersProductsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :carts_products do |t|
      t.integer :cart_id, null: false
      t.integer :product_id, null: false
      t.index [:cart_id, :product_id]
    end
  end
end
