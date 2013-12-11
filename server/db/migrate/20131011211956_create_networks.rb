class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :name
      t.string :icon
      t.string :link
      t.boolean :hidden
      t.boolean :showName

      t.timestamps
    end
  end
end
