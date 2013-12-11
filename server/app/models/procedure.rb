class Procedure < ActiveRecord::Base
	has_many :part_procedures
	accepts_nested_attributes_for :part_procedures, allow_destroy: true
end
