class OrdersController < ApplicationController
  helper_method :enoughParts
  helper_method :updateParts

	def index
        authUserFor("Orders")
      	@order = Order.all
  	end # index
	
  	def show
        authUserFor("Orders", "edit")
      	@order = Order.find_by id: params[:id]
  	end # show
	
  	def new
        authUserFor("Orders", "edit")
      	@order = Order.new
  	end # new
	
  	def edit
        authUserFor("Orders", "edit")
      	@order = Order.find_by id: params[:id]
  	end # edit

  	##################
  	### Rails CRUD ###
  	##################

    def order_params
        params.require(:order).permit(:description, :status, :timeStart, :timeFinish, :client_id, :vehicle_id, :user_id,
                                      order_procedures_attributes: [:procedure_id, :id, :_destroy],
                                      order_parts_attributes: [:part_id, :id, :_destroy, :quantity])
    end
	
  	def create
  		@order = Order.new(order_params)

      # Check if there are enough parts
      #if !enoughParts(@order)
      #  flash[:error] = "Nedovoljno dijelova na lageru!"
      #  render "new"
      #  return
      #end

  		if @order.save
        updateParts(@order)
  			redirect_to orders_path()
  		else
  			render "new"
  		end
  	end # create
	
  	def update
      @order = Order.find_by id: params[:id]
      if @order.update_attributes(order_params)
        #enoughParts(@order)
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

    ###################
    ###   Helpers   ###
    ###################
    def enoughParts(order)
      allParts = {}

      order.order_procedures.each do |oproc|
        oproc.procedure.part_procedures.each do |ppar|
          allParts[ppar.part_id] = ppar.quantity
        end
      end
      order.order_parts.each do |opar|
        allParts[opar.part_id] += opar.quantity
      end

      allParts.keys.sort.each do |key|
        part = Part.find_by id: key
        if part.quantity < allParts[key]
          return false
        end
      end
      return true
    end

    def updateParts(order)
      allParts = {}

      order.order_procedures.each do |oproc|
        oproc.procedure.part_procedures.each do |ppar|
          allParts[ppar.part_id] = ppar.quantity
        end
      end
      order.order_parts.each do |opar|
        allParts[opar.part_id] += opar.quantity
      end

      allParts.keys.sort.each do |key|
        part = Part.find_by id: key
        part.quantity -= allParts[key].to_f
        part.save
      end
    end
end
