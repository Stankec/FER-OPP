# encoding: UTF-8
class NetworksController < ApplicationController
	def index
		authUser
		@network = Network.all
	end # index

	def new
		authUser
		@network = Network.new
	end # new

	def edit 
		authUser
		@network = Network.find_by id: params[:id]
	end # edit

	##################
	### Rails CRUD ###
	##################

	def network_params
        params.require(:network).permit(:name, :icon, :link, :hidden, :showName, :description)
    end
	
  	def create
  		@network = Network.new(network_params)
  		if @network.save
  			redirect_to root_url
  		else
  			render "new"
  		end
  	end # create
	
  	def update
  		@network = Network.find_by id: params[:id]
  		if @network.update_attributes(network_params)
  			redirect_to root_url
  		else
  			render "edit"
  		end
  	end # update
	
  	def destroy
  		@network = Network.find_by id: params[:id]
  		if @network.destroy
  			redirect_to root_url
  		else
  			redirect_to :back
  		end
  	end # delete
end
