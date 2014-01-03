class ClientsController < ApplicationController
	  def index
      	@client = Client.all
  	end # index
	
  	def show
      	@client = Client.find_by id: params[:id]
  	end # show
	
  	def new
      	@client = Client.new
  	end # new
	
  	def edit
      	@client = Client.find_by id: params[:id]
  	end # edit

  	##################
  	### Rails CRUD ###
  	##################

    def client_params
        params.require(:client).permit(:nameFirst, :nameLast, :contactAdress, :contactTelephone, {:vehicle_ids => []}, client_vehicles_attributes: [:vehicle_id, :id, :_destroy])
    end
	
  	def create
  		@client = Client.new(client_params)
  		if @client.save
  			redirect_to clients_path()
  		else
  			render "new"
  		end
  	end # create
	
  	def update
  		@client = Client.find_by id: params[:id]
  		if @client.update_attributes(client_params)
  			redirect_to clients_path()
  		else
  			render "edit"
  		end
  	end # update
	
  	def destroy
  		@client = Client.find_by id: params[:id]
  		if @client.destroy
  			redirect_to clients_path
  		else
  			redirect_to :back
  		end
  	end # delete
end
