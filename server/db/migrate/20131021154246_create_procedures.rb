class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :name
      t.text :description
      t.integer :minNumOfWorkers
      t.float :duration
      t.float :manHour

      t.timestamps
    end
  end
end
