class Client < ActiveRecord::Base
	has_many :vehicles
	has_many :client_vehicles
	accepts_nested_attributes_for :client_vehicles, allow_destroy: true
end
