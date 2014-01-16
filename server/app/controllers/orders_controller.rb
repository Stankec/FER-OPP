# encoding: UTF-8
class OrdersController < ApplicationController
  helper_method :enoughParts
  helper_method :takeParts

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
      	if !enoughParts(@order)
      	  flash.now.alert = "Nedovoljno dijelova na lageru!"
      	  render "new"
      	  return
      	end

  		if @order.save
        	takeParts(@order)
  			redirect_to orders_path()
  		else
  			flash.now.alert = "Provjerite dali ste dodali barem jedan postupak i/ili dali svi pridruženi dijelovim imaju definiranu količinu<br>"
  			displayErrors(@order)
  			render "new"
  		end
  	end # create
	
  	def update
      	@order = Order.find_by id: params[:id]

      	if @order == nil 
      		return
      	end

      	updatedParts = {}
      	oldParts = {}

      	# Updated parts
      	params[:order][:order_parts_attributes].values.each do |item|
      		if item["_destroy"] != "false"; next; end;
      		if updatedParts[item["part_id"].to_i] == nil
				updatedParts[item["part_id"].to_i] = item["quantity"].to_f
			else
				updatedParts[item["part_id"].to_i] += item["quantity"].to_f
			end
		end if params[:order][:order_parts_attributes]
		params[:order][:order_procedures_attributes].values.each do |item|
			if item["_destroy"] != "false"; next; end;
			item = Procedure.find_by id: item["procedure_id"]
			item.part_procedures.each do |pp|
	      		if updatedParts[pp.part_id] == nil
					updatedParts[pp.part_id] = pp.quantity
				else
					updatedParts[pp.part_id] += pp.quantity
				end
			end
		end if  params[:order][:order_procedures_attributes]

		# Old parts
		@order.order_parts.each do |op|
			if oldParts[op.part_id] == nil
				oldParts[op.part_id] = op.quantity
			else
				oldParts[op.part_id] += op.quantity
			end
		end
		@order.order_procedures.each do |op|
			op = op.procedure
			op.part_procedures.each do |pp|
	      		if oldParts[pp.part_id] == nil
					oldParts[pp.part_id] = pp.quantity
				else
					oldParts[pp.part_id] += pp.quantity
				end
			end
		end if  params[:order][:order_procedures_attributes]

		# Delta parts
		oldParts.keys.each do |key|
			oldParts[key] *= -1
		end
		updatedParts.keys.each do |key|
			if oldParts[key] == nil
				oldParts[key] = updatedParts[key]
			else
				oldParts[key] += updatedParts[key]
			end
		end

		# Do we have enough parts?
		oldParts.keys.each do |key|
			part = Part.find_by id: key
			if part == nil; next; end;
			if part.quantity - oldParts[key] < 0
				flash.now.alert = "Nedovoljno dijelova na lageru!"
				render "edit"
				return
			end
		end

  		# Sucess!
      	if @order.update_attributes(order_params)
      		# Update parts
      		oldParts.keys.each do |key|
				part = Part.find_by id: key
				if part == nil; next; end;
				part.quantity -= oldParts[key]
				part.save
			end
      		# Redirect
  			redirect_to orders_path()
  		else
  			flash.now.alert = "Provjerite dali ste dodali barem jedan postupak i/ili dali svi pridruženi dijelovim imaju definiranu količinu<br>"
  			displayErrors(@order)
  			render "edit"
  		end
  	end # update
	
  	def destroy
  		@order = Order.find_by id: params[:id]

	    # If the order is closed delete it, else return the parts to storage
	    if @order.status != 3
	      	returnParts(@order)
	    end

  		if @order.destroy
	      	# Redirect to all orders
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
      	if allParts[opar.part_id] != nil
        	allParts[opar.part_id] += opar.quantity
        else
        	allParts[opar.part_id] = opar.quantity
        end
      end

      allParts.keys.sort.each do |key|
        part = Part.find_by id: key
        if part.quantity < allParts[key]
          return false
        end
      end
      return true
    end

    def takeParts(order)
      allParts = {}

      order.order_procedures.each do |oproc|
        oproc.procedure.part_procedures.each do |ppar|
          allParts[ppar.part_id] = ppar.quantity
        end
      end
      order.order_parts.each do |opar|
        if allParts[opar.part_id] != nil
        	allParts[opar.part_id] += opar.quantity
        else
        	allParts[opar.part_id] = opar.quantity
        end
      end

      allParts.keys.sort.each do |key|
        part = Part.find_by id: key
        part.quantity -= allParts[key].to_f
        part.save
      end
    end

    def returnParts(order)
      allParts = {}

      order.order_procedures.each do |oproc|
        oproc.procedure.part_procedures.each do |ppar|
          allParts[ppar.part_id] = ppar.quantity
        end
      end
      order.order_parts.each do |opar|
        if allParts[opar.part_id] != nil
        	allParts[opar.part_id] += opar.quantity
        else
        	allParts[opar.part_id] = opar.quantity
        end
      end

      allParts.keys.sort.each do |key|
        part = Part.find_by id: key
        part.quantity += allParts[key].to_f
        part.save
      end
    end
end
