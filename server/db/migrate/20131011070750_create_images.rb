class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :imageName
      t.integer :imageType
      t.string :path
      t.boolean :isHidden

      t.timestamps
    end
  end
end