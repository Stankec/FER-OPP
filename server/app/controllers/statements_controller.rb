class StatementsController < ApplicationController
  	def index
      if !params[:page]; params[:page] = 1; end;
      if !params[:type]; params[:type] = 0; end;
      @statement   = Statement.where(:statemnetType => params[:type]).order("statementDate DESC").paginate(:page => params[:page].to_i, :per_page => 20)
  	end
	
  	def show
  	end
	
  	def edit
  	end
	
  	def new
  	end

  	##################
  	### Rails CRUD ###
  	##################

    def statement_params
        params.require(:statement).permit(:statemnetType, :statementDate, :money)
    end

end
