class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug, index: true
      t.string :ancestry
      t.string :icon
      t.text :content
      t.text :contentPreview
      t.boolean :isPublic
      t.boolean :isHidden
      t.boolean :hasPreview
      t.references :category, index: true

      t.timestamps
    end
  end
end
