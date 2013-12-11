class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :vehicleModel
      t.integer :buildYear
      t.string :vehicleRegistration

      t.timestamps
    end
  end
end
