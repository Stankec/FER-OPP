class VehiclesController < ApplicationController
	def index
        authUserFor("Vehicles")
      	@vehicle = Vehicle.all
  	end # index
	
  	def show
        authUserFor("Vehicles")
      	@vehicle = Vehicle.find_by id: params[:id]
  	end # show
	
  	def new
        authUserFor("Vehicles", "edit")
      	@vehicle = Vehicle.new
  	end # new
	
  	def edit
        authUserFor("Vehicles", "edit")
      	@vehicle = Vehicle.find_by id: params[:id]
  	end # edit

  	##################
  	### Rails CRUD ###
  	##################

    def vehicle_params
        params.require(:vehicle).permit(:vehicleModel, :buildYear, :vehicleRegistration, {:client_ids => []}, client_vehicles_attributes: [:client_id, :id, :_destroy])
    end
	
  	def create
  		@vehicle = Vehicle.new(vehicle_params)
  		if @vehicle.save
  			redirect_to vehicles_path()
  		else
  			render "new"
  		end
  	end # create
	
  	def update
  		@vehicle = Vehicle.find_by id: params[:id]
  		if @vehicle.update_attributes(vehicle_params)
  			redirect_to vehicles_path()
  		else
  			render "edit"
  		end
  	end # update
	
  	def destroy
  		@vehicle = Vehicle.find_by id: params[:id]
  		if @vehicle.destroy
  			redirect_to vehicles_path
  		else
  			redirect_to :back
  		end
  	end # delete
end
