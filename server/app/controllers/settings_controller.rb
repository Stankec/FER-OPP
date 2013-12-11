# encoding: UTF-8
class SettingsController < ApplicationController
  	def edit
  		authUser
  		initial
  		@setting = Setting.first
  	end # edit

  	##################
  	### Rails CRUD ###
  	##################

    def setting_params
        params.require(:setting).permit(:pageTitle, :pageDescription, :pageFavicon_id, :pagePreview_id)
    end
	
  	def create
  		@setting = Setting.new(setting_params)
  		if @setting.save
  			redirect_to root_url
  		else
  			render "new"
  		end
  	end # create
	
  	def update
  		@setting = Setting.find_by id: params[:id]
  		if @setting.update_attributes(setting_params)
  			redirect_to root_url
  		else
  			render "edit"
  		end
  	end # update
	
  	def destroy
  		@setting = Setting.find_by id: params[:id]
  		if @setting.destroy
  			redirect_to root_url
  		else
  			redirect_to :back
  		end
  	end # delete
end
