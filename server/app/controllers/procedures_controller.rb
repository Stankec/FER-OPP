class ProceduresController < ApplicationController
	def index
		@procedure = Procedure.all
	end # index

	def show
		@procedure = Procedure.find_by id: params[:id]
	end # show

	def edit
		@procedure = Procedure.find_by id: params[:id]
	end # edit

	def new
		@procedure = Procedure.new
	end # new

  	##################
  	### Rails CRUD ###
  	##################

    def procedure_params
        params.require(:procedure).permit(:name, :description, :minNumOfWorkers, :duration, :manHour, part_procedures_attributes: [:part_id, :quantity, :id, :_destroy] )
    end # params
	
  	def create
  		@procedure = Procedure.new(procedure_params)
  		if @procedure.save
  			redirect_to procedures_path()
  		else
  			render "new"
  		end
  	end # create
	
  	def update
  		@procedure = Procedure.find_by id: params[:id]
  		if @procedure.update_attributes(procedure_params)
  			redirect_to procedures_path()
  		else
  			render "edit"
  		end
  	end # update
	
  	def destroy
  		@procedure = Procedure.find_by id: params[:id]
  		if @procedure.destroy
  			redirect_to procedures_path
  		else
  			redirect_to :back
  		end
  	end # delete
end
