class OrderPart < ActiveRecord::Migration
  	def change
  		create_table 'orders_parts' do |t|
	    	t.belongs_to :order
	    	t.belongs_to :part
  		end
  	end
end
