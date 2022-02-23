class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :article, null: false
      t.string :name, null: false
      t.string :description
      t.integer :price, null: false
      t.integer :amount, null: false, default: 0

      t.timestamps
    end
  end
end
