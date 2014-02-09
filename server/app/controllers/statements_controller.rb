# encoding: UTF-8
class StatementsController < ApplicationController
	def index
		authUserFor("Statements")
		if !params[:page]; params[:page] = 1; end;
		if !params[:type]; params[:type] = 0; end;
		@statement   = Statement.where(:statemnetType => params[:type]).order("statementDate DESC").paginate(:page => params[:page].to_i, :per_page => 20)
	end # index
	
	def show
	end # show
	
	def edit
	end # edit
	
	def new
	end # new

	##################
	### Rails CRUD ###
	##################

	def statement_params
	    params.require(:statement).permit(:statemnetType, :statementDate, :money)
	end # statement_params

end
