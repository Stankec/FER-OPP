# encoding: utf-8
class UsersController < ApplicationController
  	def index
  		authUser
      	@user = User.all
  	end # index
	
  	def show
  		authUser
      	@user = User.find_by id: params[:id]
  	end # show
	
  	def new
  		authUser
      	@user = User.new
  	end # new
	
  	def edit
  		authUser
      	@user = User.find_by id: params[:id]
  	end # edit
	
  	##################
  	### Rails CRUD ###
  	##################

    def user_params
        params.require(:user).permit(:nameFirst, :nameLast, :loginUsername, :password, :contactEmail, :contactPhone, {:role_ids => []})
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
