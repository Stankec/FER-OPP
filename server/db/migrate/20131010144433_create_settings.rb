class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :pageTitle
      t.text :pageDescription
      t.references :pageFavicon
      t.references :pagePreview

      t.timestamps
    end
  end
end
