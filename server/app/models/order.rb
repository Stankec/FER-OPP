class Order < ActiveRecord::Base
  	belongs_to :client
  	belongs_to :vehicle
  	belongs_to :user
  	has_many :order_procedures
	accepts_nested_attributes_for :order_procedures, allow_destroy: true
	has_many :order_parts
	accepts_nested_attributes_for :order_parts, allow_destroy: true
end
