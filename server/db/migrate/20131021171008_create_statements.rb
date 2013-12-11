class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.integer :type
      t.date :statementDate
      t.float :money

      t.timestamps
    end
  end
end
