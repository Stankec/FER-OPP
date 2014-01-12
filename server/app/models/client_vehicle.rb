class ClientVehicle < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :client
end
