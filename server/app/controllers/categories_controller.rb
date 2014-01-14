# encoding: UTF-8
class CategoriesController < ApplicationController
  	def index
      	authUserFor("Categories")
  		@category = Category.roots
  	end # index

    def show
      	@category = Category.friendly.find params[:id]
      	@pages = Page.where(:category_id => @category.id).page(params[:page]).per_page(5)
    end # show
	
  	def new
      	authUserFor("Categories", "edit")
  		@category = Category.new
  	end # new
	
  	def edit
      	authUserFor("Categories", "edit")
  		@category = Category.friendly.find params[:id]
  	end # edit

  	##################
  	### Rails CRUD ###
  	##################

    def category_params
        params.require(:category).permit(:title, :icon, :parent_id)
    end
	
  	def create
  		@category = Category.new(category_params)
  		if @category.save
  			@category = Category.roots
  			respond_to do |format|
	        	format.html	{ redirect_to categories_path }
	        	format.js	{ render "index.js.erb" }
	        end
  		else
  			render "new"
  		end
  	end # create
	
  	def update
  		@category = Category.friendly.find params[:id]
  		if @category.update_attributes(category_params)
  			respond_to do |format|
  				@category = Category.roots
	        	format.html	{ redirect_to categories_path }
	        	format.js	{ render "index.js.erb" }
	        end
  		else
  			render "edit"
  		end
  	end # update
	
  	def destroy
  		@category = Category.friendly.find params[:id]
  		if @category.destroy
  			@category = Category.roots
	        respond_to do |format|
	        	format.html	{ redirect_to categories_path }
	        	format.js	{ render "index.js.erb" }
	        end
  		else
  			redirect_to :back
  		end
  	end # delete
end
