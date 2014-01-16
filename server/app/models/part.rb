class Part < ActiveRecord::Base
	validates :name, presence: true
	validates :price, presence: true, numericality: true
	validates :quantity, presence: true, numericality: true
end
