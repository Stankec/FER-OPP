class PartProcedure < ActiveRecord::Migration
  	def change
  		create_table 'parts_procedures' do |t|
	    	t.belongs_to 	:part
	    	t.belongs_to 	:procedure
	    	t.float 		:quantity
  		end
  	end
end
