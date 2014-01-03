class OrdersController < ApplicationController
	def index
      	@order = Order.all
  	end # index
	
  	def show
      	@order = Order.find_by id: params[:id]
  	end # show
	
  	def new
      	@order = Order.new
  	end # new
	
  	def edit
      	@order = Order.find_by id: params[:id]
  	end # edit

  	##################
  	### Rails CRUD ###
  	##################

    def order_params
        params.require(:order).permit(:description, :status, :timeStart, :timeFinish, :client_id, :vehicle_id, :user_id)
    end
	
  	def create
  		@order = Order.new(order_params)
  		if @order.save
  			redirect_to orders_path()
  		else
  			render "new"
  		end
  	end # create
	
  	def update
  		@order = Order.find_by id: params[:id]
  		if @order.update_attributes(order_params)
  			redirect_to orders_path()
  		else
  			render "edit"
  		end
  	end # update
	
  	def destroy
  		@order = Order.find_by id: params[:id]
  		if @order.destroy
  			redirect_to orders_path
  		else
  			redirect_to :back
  		end
  	end # delete
end
