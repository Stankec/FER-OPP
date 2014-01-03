class CreateClientVehicles < ActiveRecord::Migration
  def change
    create_table :client_vehicles do |t|
      t.references :vehicle, index: true
      t.references :client, index: true

      t.timestamps
    end
  end
end
