class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.integer :statemnetType
      t.date 	:statementDate
      t.float 	:money

      t.timestamps
    end
  end
end
