class Procedure < ActiveRecord::Base
	has_many :parts, :through => :part_procedures
	has_many :part_procedures, inverse_of: :procedure
	accepts_nested_attributes_for :part_procedures, allow_destroy: true

	validates :name, presence: true
	validates :duration, presence: true, numericality: true
	validates :manHour, presence: true, numericality: true
	validates :minNumOfWorkers, presence: true, numericality: true
	validates :part_procedures, :length => { :minimum => 1 }
	validates_associated  :part_procedures
end
