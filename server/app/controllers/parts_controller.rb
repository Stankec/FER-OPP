# encoding: UTF-8
class PartsController < ApplicationController
	def index
		authUserFor("Parts")
		@part = Part.all
	end # index
	
	def show
		authUserFor("Parts")
		@part = Part.find_by id: params[:id]
	end # show
	
	def edit
		authUserFor("Parts", "edit")
		@part = Part.find_by id: params[:id]
	end # edit
	
	def new
		authUserFor("Parts", "edit")
		@part = Part.new
	end # new

	##################
	### Rails CRUD ###
	##################

	def part_params
	       params.require(:part).permit(	:name,
											:quantity,
											:price,
											:description)
	end # part_params

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
			displayErrors(@part)
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
			displayErrors(@part)
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
