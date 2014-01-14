# encoding: UTF-8
class PagesController < ApplicationController
	require 'will_paginate/array'

  	def index
      	if params[:search]
  		  	@page = Page.search(params[:search])
  		  	if @page != nil
  		  		if !params[:page]; params[:page] = 1; end;
  		  		@page = @page.paginate(:page => params[:page].to_i, :per_page => 5)
  		  	end
      	else
      		@page = Page.where(:isPublic => true).where.not(:isHidden => true).page(params[:page]).per_page(5)
    	end
      
  	end # index
	
  	def unpublished
  		authUserFor("Pages")
  		@page = Page.where.not(:isPublic => true) + Page.where(:isHidden => true)
      	if !params[:page]; params[:page] = 1; end;
      	@page = @page.uniq.paginate(:page => params[:page].to_i, :per_page => 5)
      	render "index"
  	end # unpublished
	
  	def show
  		@page = Page.friendly.find params[:id]
  		if @page.isPublic != true && currentUser == nil
  			redirect_to root_url
  		end
  	end # show
	
  	def edit
  		authUserFor("Pages", "edit")
  		@page = Page.friendly.find params[:id]
  	end # edit
	
  	def new
  		authUserFor("Pages", "edit")
  		@page = Page.new
  	end # new
	
  	##################
  	### Rails CRUD ###
  	##################
	
    def page_params
        params.require(:page).permit(:title, :slug, :tag_list, :content, :contentPreview, :isPublic, :isHidden, :hasPreview, :category, :category_id, :icon)
    end

  	def create
  		@page = Page.new(page_params)
      	if @page.slug == nil || @page.slug.length == 0
	    	@page.slug = @page.title.downcase.gsub(' ', '-')
	    else
	    	@page.slug = @page.slug.downcase.gsub(' ', '-')
	    end
  		if @page.save
  			redirect_to page_path(@page)
  		else
  			render "new"
  		end
  	end # create
	
  	def update
  		@page = Page.friendly.find params[:id]
  		if @page.update_attributes(page_params)
  			if @page.slug == nil || @page.slug.length == 0
	      		@page.slug = @page.title.downcase.gsub(' ', '-')
	      	else
	      		@page.slug = @page.slug.downcase.gsub(' ', '-')
	      	end
	      	@page.save
  			redirect_to page_path(@page)
  		else
  			render "edit"
  		end
  	end # update
	
  	def destroy
  		@page = Page.friendly.find params[:id]
  		if @page.destroy
  			redirect_to pages_path
  		else
  			redirect_to :back
  		end
  	end # delete


end
