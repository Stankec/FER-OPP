# encoding: UTF-8
class WorkingHoursController < ApplicationController
	def index
		authUserFor("WorkingHours")
		@wh = WorkingHour.where.not(:exception =>  true).order('day')
		@whe = WorkingHour.where(:exception =>  true).order('exceptiondate')
	end # index
	
	def edit
		authUserFor("WorkingHours", "edit")
		@workingHour = WorkingHour.find_by id: params[:id]
	end # edit 
	
	def new
		authUserFor("WorkingHours", "edit")
		@workingHour = WorkingHour.new
		@workingHour.timeStart = Time.now.in_time_zone('London').change(:hour => 8, :min => 0)
		@workingHour.timeFinish = Time.now.in_time_zone('London').change(:hour => 16, :min => 0)
	end # new
	
	##################
	### Rails CRUD ###
	##################

	def workingHour_params
	       params.require(:working_hour).permit(	:day,
													:timeStart,
													:timeFinish,
													:exception,
													:exceptiondate)
	end # workingHour_params

	def create
		@workingHour = WorkingHour.new(workingHour_params)
		if @workingHour.save
			redirect_to working_hours_path
		else
			render "new"
		end
	end # create
	
	def update
		@workingHour = WorkingHour.find_by id: params[:id]
		if @workingHour.update_attributes(workingHour_params)
			redirect_to working_hours_path
		else
			render "edit"
		end
	end # update
	
	def destroy
		@workingHour = WorkingHour.find_by id: params[:id]
		if @workingHour.destroy
			redirect_to working_hours_path
		else
			redirect_to :back
		end
	end # delete
end
