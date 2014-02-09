# encoding: UTF-8
class SessionsController < ApplicationController
	def new
		if @currentUser != nil
			redirect_to root_url
		end
	end # new

	##################
	### Rails CRUD ###
	##################
	
	def create
		@user = User.find_by loginUsername: params[:loginUsername]
		if @user && @user.authenticate(params[:loginUsername], params[:password])
			if params[:rememberMe]
				cookies.permanent[:loginAuthToken] = @user.loginAuthToken
			else
				cookies[:loginAuthToken] = @user.loginAuthToken
			end
			@user.loginLast = DateTime.now
			@user.save
			redirect_to root_path
		else
			flash.now.alert = "Krivo <u>korisničko ime</u> ili <u>lozinka</u>"
			render "new"
		end
	end # create
	
	def destroy
		cookies.delete(:loginAuthToken)
	   	redirect_to root_url
	end # destroy
end
