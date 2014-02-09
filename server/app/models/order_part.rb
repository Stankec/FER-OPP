class OrderPart < ActiveRecord::Base
	belongs_to :order
	belongs_to :part

	validates :quantity, presence: true, numericality: true
end
