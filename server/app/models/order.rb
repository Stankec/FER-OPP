# encoding: UTF-8
class Order < ActiveRecord::Base
  	belongs_to :client
  	belongs_to :vehicle
  	belongs_to :user
  	has_many :order_procedures
	accepts_nested_attributes_for :order_procedures, allow_destroy: true
	has_many :order_parts
	accepts_nested_attributes_for :order_parts, allow_destroy: true

	validates :order_procedures, :length => { :minimum => 1 }
	validate :start_must_be_before_end_time
	validates_associated  :order_parts

	def start_must_be_before_end_time
    	errors.add(:timeFinish, "Mora biti poslje početnog vremena") unless
       		self.timeStart < self.timeFinish
  	end 
end
