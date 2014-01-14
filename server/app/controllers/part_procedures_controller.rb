# encoding: UTF-8
class PartProceduresController < ApplicationController
	
	##################
  	### Rails CRUD ###
  	##################

    def part_procedure_params
        params.require(:part_procedure).permit(:part_id, :procedure_id, :quantity)
    end # params
	
  	def create
  		@part_procedure = PartProcedure.new(part_procedure_params)
  		if @part_procedure.save
  			redirect_to procedures_path()
  		else
  			render "new"
  		end
  	end # create
	
  	def update
  		@part_procedure = PartProcedure.find_by id: params[:id]
  		if @part_procedure.update_attributes(part_procedure_params)
  			redirect_to procedures_path()
  		else
  			render "edit"
  		end
  	end # update
	
  	def destroy
  		@part_procedure = PartProcedure.find_by id: params[:id]
  		if @part_procedure.destroy
  			redirect_to procedures_path
  		else
  			redirect_to :back
  		end
  	end # delete
end
