class Client < ActiveRecord::Base
	has_many :vehicles, :through => :client_vehicles
	has_many :client_vehicles
	accepts_nested_attributes_for :client_vehicles, allow_destroy: true

	validates :nameFirst, presence: true
	validates :nameLast, presence: true
	validates :contactTelephone, presence: true
end
