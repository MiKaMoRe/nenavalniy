class CreateJoinTableProductsProperties < ActiveRecord::Migration[6.1]
  def change
    create_join_table :products, :properties do |t|
      t.index [:product_id, :property_id]
      # t.index [:property_id, :product_id]

      t.string :value, null: false
    end
  end
end
