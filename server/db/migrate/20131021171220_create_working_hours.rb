class CreateWorkingHours < ActiveRecord::Migration
  def change
    create_table :working_hours do |t|
      t.integer :day
      t.time :timeStart
      t.time :timeFinish
      t.boolean :exception
      t.date :exceptiondate

      t.timestamps
    end
  end
end
