# encoding: UTF-8
class ApplicationController < ActionController::Base
  	# Prevent CSRF attacks by raising an exception.
  	# For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception
  	helper_method :initial
  	helper_method :currentUser
  	helper_method :authUser
  	helper_method :gravatarUrl
    helper_method :pageTitle
    helper_method :genFaviconTags
    helper_method :genSocialMediaTags
    helper_method :cleanup
	
  	def initial
      if Setting.first == nil
        settings = Setting.new
        settings.pageTitle = "Mehaničar"
        settings.pageDescription = "Popravljamo sve od gepufne do cinculatora"
        settings.save
      end

      if Role.first == nil
        role = Role.new
        role.name = "Admin"
          role.canViewUsers = true
          role.canViewRoles = true
          role.canViewOrders = true
          role.canViewClients = true
          role.canViewVehicles = true
          role.canViewProcedures = true
          role.canViewSettings = true
          role.canViewParts = true
          role.canViewworkingHours = true
          role.canViewStatements = true
          role.canViewNetworks = true
          role.canViewPages = true
          role.canViewCategories = true
          #
          role.canChangeUsers = true
          role.canChangeRoles = true
          role.canChangeOrders = true
          role.canChangeClients = true
          role.canChangeVehicles = true
          role.canChangeProcedures = true
          role.canChangeSettings = true
          role.canChangeParts = true
          role.canChangeworkingHours = true
          role.canChangeStatements = true
          role.canChangeNetworks = true
          role.canChangePages = true
          role.canChangeCategories = true
        role.save

        role = Role.new
        role.name = "Mehaničar"
          role.canViewUsers = true
          role.canViewRoles = true
          role.canViewOrders = true
          role.canViewClients = true
          role.canViewVehicles = true
          role.canViewProcedures = true
          role.canViewSettings = true
          role.canViewParts = true
          role.canViewworkingHours = true
          role.canViewStatements = true
          role.canViewNetworks = true
          role.canViewPages = true
          role.canViewCategories = true
          #
          role.canChangeUsers = true
          role.canChangeRoles = true
          role.canChangeOrders = true
          role.canChangeClients = true
          role.canChangeVehicles = true
          role.canChangeProcedures = true
          role.canChangeSettings = true
          role.canChangeParts = false
          role.canChangeworkingHours = true
          role.canChangeStatements = true
          role.canChangeNetworks = true
          role.canChangePages = true
          role.canChangeCategories = true
        role.save

        role = Role.new
        role.name = "Električar"
          role.canViewUsers = true
          role.canViewRoles = true
          role.canViewOrders = true
          role.canViewClients = true
          role.canViewVehicles = true
          role.canViewProcedures = true
          role.canViewSettings = true
          role.canViewParts = true
          role.canViewworkingHours = true
          role.canViewStatements = true
          role.canViewNetworks = true
          role.canViewPages = true
          role.canViewCategories = true
          #
          role.canChangeUsers = true
          role.canChangeRoles = true
          role.canChangeOrders = true
          role.canChangeClients = true
          role.canChangeVehicles = true
          role.canChangeProcedures = true
          role.canChangeSettings = true
          role.canChangeParts = false
          role.canChangeworkingHours = true
          role.canChangeStatements = true
          role.canChangeNetworks = true
          role.canChangePages = true
          role.canChangeCategories = true
        role.save

        role = Role.new
        role.name = "Voditelj Servisa"
          role.canViewUsers = true
          role.canViewRoles = true
          role.canViewOrders = true
          role.canViewClients = true
          role.canViewVehicles = true
          role.canViewProcedures = true
          role.canViewSettings = true
          role.canViewParts = true
          role.canViewworkingHours = true
          role.canViewStatements = true
          role.canViewNetworks = true
          role.canViewPages = true
          role.canViewCategories = true
          #
          role.canChangeUsers = true
          role.canChangeRoles = true
          role.canChangeOrders = true
          role.canChangeClients = true
          role.canChangeVehicles = true
          role.canChangeProcedures = true
          role.canChangeSettings = true
          role.canChangeParts = true
          role.canChangeworkingHours = true
          role.canChangeStatements = true
          role.canChangeNetworks = true
          role.canChangePages = true
          role.canChangeCategories = true
        role.save

        role = Role.new
        role.name = "Direktor"
          role.canViewUsers = true
          role.canViewRoles = true
          role.canViewOrders = true
          role.canViewClients = true
          role.canViewVehicles = true
          role.canViewProcedures = true
          role.canViewSettings = true
          role.canViewParts = false
          role.canViewworkingHours = true
          role.canViewStatements = true
          role.canViewNetworks = true
          role.canViewPages = true
          role.canViewCategories = true
          #
          role.canChangeUsers = true
          role.canChangeRoles = true
          role.canChangeOrders = true
          role.canChangeClients = true
          role.canChangeVehicles = true
          role.canChangeProcedures = true
          role.canChangeSettings = true
          role.canChangeParts = false
          role.canChangeworkingHours = true
          role.canChangeStatements = true
          role.canChangeNetworks = true
          role.canChangePages = true
          role.canChangeCategories = true
        role.save
      end
  		
      if User.first == nil
  			user = User.new
  			user.nameFirst = "Nemo"
  			user.nameLast  = "Nihili"
  			user.loginUsername 	= "admin"
  			user.password 		= "admin"
  			user.save
  		end

      if WorkingHour.first == nil
        wh = WorkingHour.new
          wh.day = 0
          wh.timeStart = Time.now.in_time_zone('London').change(:hour => 8, :min => 0)
          wh.timeFinish = Time.now.in_time_zone('London').change(:hour => 16, :min => 0)
          wh.exception = false
        wh.save
        wh = WorkingHour.new
          wh.day = 1
          wh.timeStart = Time.now.in_time_zone('London').change(:hour => 8, :min => 0)
          wh.timeFinish = Time.now.in_time_zone('London').change(:hour => 16, :min => 0)
          wh.exception = false
        wh.save
        wh = WorkingHour.new
          wh.day = 2
          wh.timeStart = Time.now.in_time_zone('London').change(:hour => 8, :min => 0)
          wh.timeFinish = Time.now.in_time_zone('London').change(:hour => 16, :min => 0)
          wh.exception = false
        wh.save
        wh = WorkingHour.new
          wh.day = 3
          wh.timeStart = Time.now.in_time_zone('London').change(:hour => 8, :min => 0)
          wh.timeFinish = Time.now.in_time_zone('London').change(:hour => 16, :min => 0)
          wh.exception = false
        wh.save
        wh = WorkingHour.new
          wh.day = 4
          wh.timeStart = Time.now.in_time_zone('London').change(:hour => 8, :min => 0)
          wh.timeFinish = Time.now.in_time_zone('London').change(:hour => 16, :min => 0)
          wh.exception = false
        wh.save
      end

    end # initial
  
  def currentUser
      @currentUser = nil
      if cookies[:loginAuthToken] == nil
        return nil
  		end
		@currentUser = User.find_by loginAuthToken: cookies[:loginAuthToken]
  	end # currentUser

	def authUser
		if currentUser == nil
			render "sessions/new"
		end
	end # authUser
	
  	def gravatarUrl(user, size)
  		if (user.contactEmail == nil || user.contactEmail.length < 5); return nil; end;
  	  	gravatar_id = Digest::MD5.hexdigest(user.contactEmail.downcase)
  	  	return "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  	end # gravatarUrl

    def pageTitle
    	if Setting.first.pageTitle != nil && Setting.first.pageTitle.length != 0
  			return Setting.first.pageTitle
  		else
  		 	return "Automehanićar Đuro"
  		end
    end # pageTitle

    def genFaviconTags
	    favicon = Setting.first.pageFavicon
	    if favicon == nil
	      	return ""
	    end
	    tags = "" + 
	    "<link rel=\"apple-touch-icon-precomposed\" sizes=\"512x512\" href=\"" + favicon.path_url(:socialMediaPreview) + "\">" +
	    "<link rel=\"apple-touch-icon-precomposed\" sizes=\"144x144\" href=\"" + favicon.path_url(:favicon144) + "\">" +
	    "<link rel=\"apple-touch-icon-precomposed\" sizes=\"114x114\" href=\"" + favicon.path_url(:favicon114) + "\">" +
	    "<link rel=\"apple-touch-icon-precomposed\" sizes=\"72x72\" href=\"" + favicon.path_url(:favicon72) + "\">" +
	    "<link rel=\"apple-touch-icon-precomposed\" href=\"" + favicon.path_url(:favicon57) + "\">" +
	    "<link rel=\"icon\" type=\"image\" href=\"" + favicon.path_url(:favicon32) + "\">"

	  end # genFaviconTags

  def genSocialMediaTags
    tags = "<meta property=\"og:site_name\" content=\"" + pageTitle + "\"/>"

    if @page != nil && @page.instance_of?(Page) && @page.title != nil
      	tags = tags + "<meta property=\"og:title\" content=\"" + @page.title + "\"/>"
    else
      	tags = tags + "<meta property=\"og:title\" content=\"" + pageTitle + "\"/>"
    end

    previewImg = Setting.first.pagePreview
    if previewImg != nil
      tags += "<meta property=\"og:image\" content=\"" + previewImg.path_url(:socialMediaPreview) + "\"/>"
    end

    if Setting.first.pageDescription != nil && Setting.first.pageDescription.length != 0
      tags += "<meta property=\"og:description\" content=\"" + Setting.first.pageDescription + "\"/>"
    end

    return tags
  end # genSocialMediaTags

  def cleanup
    # Remove orphaned images
    if currentUser != nil
      Image.where("imageType = 11 AND attachedTo IS NULL AND imageOwner = ?", currentUser.id ).each do |i|
        i.destroy
      end
    end
  end # cleanup

end
