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
  	end # start_must_be_before_end_time

  	def price
  		allParts = {}
  		price = 0.0
      	self.order_procedures.each do |oproc|
      	  	oproc.procedure.part_procedures.each do |ppar|
      	  		if allParts[ppar.part_id] != nil
      	  	  		allParts[ppar.part_id] += ppar.quantity
      	  	  	else
      	  	  		allParts[ppar.part_id] = ppar.quantity
      	  	  	end
      	  	end
      	  	price += oproc.procedure.minNumOfWorkers * oproc.procedure.duration * oproc.procedure.manHour
      	end
      	self.order_parts.each do |opar|
      		if allParts[opar.part_id] != nil
      	  		allParts[opar.part_id] += opar.quantity
      	  	else
      	  		allParts[opar.part_id] = opar.quantity
      	  	end
      	end
      	allParts.keys.each do |key|
      		if Part.where(:id => key).any?
      			price += allParts[key] * Part.where(:id => key).first.price
      		end
      	end
      	return price
  	end # price
end
