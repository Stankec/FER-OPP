class OrderProcedure < ActiveRecord::Migration
  def change
  		create_table 'orders_procedures' do |t|
	    	t.belongs_to :order
	    	t.belongs_to :procedure
  		end
  end
end
