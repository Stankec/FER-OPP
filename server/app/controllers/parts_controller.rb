class PartsController < ApplicationController
  	def index
  		@part = Part.all
  	end
	
  	def show
  		@part = Part.find_by id: params[:id]
  	end
	
  	def edit
  		@part = Part.find_by id: params[:id]
  	end
	
  	def new
  		@part = Part.new
  	end

  	##################
 	### Rails CRUD ###
 	##################

 	def part_params
 	       params.require(:part).permit(	:name,
											:quantity,
											:price,
											:description)
    end

    def create
  		@part = Part.new(part_params)
  		if @part.save
  			img = Image.find_by id: params[:myImageID]
	  		if img != nil
	  			img.attachedTo = @part.id
	  			img.save
	  		end
  			redirect_to parts_path
  		else
  			render "new"
  		end
  	end # create
	
  	def update
  		@part = Part.find_by id: params[:id]
  		if @part.update_attributes(part_params)
  			img = Image.find_by id: params[:myImageID]
	  		if img != nil
	  			img.attachedTo = @part.id
	  			img.save
	  		end
  			redirect_to parts_path
  		else
  			render "edit"
  		end
  	end # update
	
  	def destroy
  		@part = Part.find_by id: params[:id]
  		if @part.destroy
  			redirect_to parts_path
  		else
  			redirect_to :back
  		end
  	end # delete
end
