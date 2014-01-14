class CreateOrderProcedures < ActiveRecord::Migration
  def change
    create_table :order_procedures do |t|
      t.references :order, index: true
      t.references :procedure, index: true

      t.timestamps
    end
  end
end
