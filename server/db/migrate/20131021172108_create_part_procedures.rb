class CreatePartProcedures < ActiveRecord::Migration
  def change
    create_table :part_procedures do |t|
      t.references :part, index: true
      t.references :procedure, index: true
      t.float :quantity

      t.timestamps
    end
  end
end
