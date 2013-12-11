class CreateOrderParts < ActiveRecord::Migration
  def change
    create_table :order_parts do |t|
      t.references :order, index: true
      t.references :part, index: true
      t.float :quantity

      t.timestamps
    end
  end
end
