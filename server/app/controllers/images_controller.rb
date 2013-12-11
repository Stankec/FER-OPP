# encoding: UTF-8
class ImagesController < ApplicationController

	##################
	### Rails CRUD ###
	##################

	def image_params
        params.require(:image).permit(:imageName, :imageType, :path, :isHidden, :attachedTo, :imageOwner)
    end
	
  	def create
  		@image = Image.new(image_params)

      if currentUser != nil
        @image.imageOwner = currentUser.id
      end

  		if @image.save
  	  		if @image.imageType == 1
	      		settings = Setting.first
	      		settings.pageFavicon_id = @image.id
	      		settings.save
      		elsif @image.imageType == 2
	      		settings = Setting.first
	      		settings.pagePreview_id = @image.id
	      		settings.save
      		end
  		else
  			#render "new"
  		end
  	end # create
	
  	def update
  		@image = Image.find_by id: params[:id]
  		if @image.update_attributes(image_params)
  			#redirect_to root_url
  		else
  			#render "edit"
  		end
  	end # update
	
  	def destroy
  		@image = Image.find_by id: params[:id]
  		@imageType = @image.imageType
  		if @image.destroy
  			redirect_to root_url
  		else
  			redirect_to :back
  		end
  	end # delete
end
