class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.index [:user_id, :cart_id]
      t.boolean :is_active, null: false
      t.boolean :is_order, null: false, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
