class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :slug, index: true
      t.string :icon
      t.string :ancestry

      t.timestamps
    end
  end
end
