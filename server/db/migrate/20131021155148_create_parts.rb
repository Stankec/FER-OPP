class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.float :quantity
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
