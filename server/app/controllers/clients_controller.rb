class ClientsController < ApplicationController
 	def index
 	end

 	def new
 	end

 	def edit
 	end

 	def show
 	end

  	##################
  	### Rails CRUD ###
  	##################

    def user_params
        params.require(:client).permit(:nameFirst, :nameLast, :contactAdress, :contactTelephone, {:vehicle_ids => []})
    end
	
  	def create
  		@user = User.new(user_params)
  		if @user.save
  			redirect_to users_path()
  		else
  			render "new"
  		end
  	end # create
	
  	def update
  		@user = User.find_by id: params[:id]
  		if @user.update_attributes(user_params)
  			redirect_to users_path()
  		else
  			render "edit"
  		end
  	end # update
	
  	def destroy
  		@user = User.find_by id: params[:id]
  		if @user.destroy
  			redirect_to users_path
  		else
  			redirect_to :back
  		end
  	end # delete
end
