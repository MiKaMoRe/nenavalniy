class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :price
      t.string :status
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
