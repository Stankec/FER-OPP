class ClientVehicle < ActiveRecord::Migration
  def change
  	create_table 'clients_vehicles' do |t|
	   	t.belongs_to :client
	   	t.belongs_to :vehicle
  	end
  end
end
