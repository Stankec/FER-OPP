# encoding: UTF-8
class ApplicationController < ActionController::Base
	include ActionView::Helpers::TagHelper
  	# Prevent CSRF attacks by raising an exception.
  	# For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception
    helper_method :displayErrors
  	helper_method :flash_display
  	helper_method :initial
  	helper_method :currentUser
  	helper_method :authUser
  	helper_method :authUserFor
  	helper_method :gravatarUrl
    helper_method :pageTitle
    helper_method :genFaviconTags
    helper_method :genSocialMediaTags
    helper_method :cleanup

    def displayErrors(object)
    	translate = {
    		"buildYear" => "Godina Izgradnje",
    		"vehicleRegistration" => "Registracija",
    		"vehicleModel" => "Model",
    		"name" => "Naziv",
    		"duration" => "Trajanje",
    		"manHour" => "Cijena čovijek-sata",
    		"minNumOfWorkers" => "Broj potrebnih radnika",
    		"nameFirst" => "Ime",
    		"nameLast" => "Prezime",
    		"contactTelephone" => "Telefon",
    		"password" => "Zaporka",
    		"password_confirmation" => "Potvrda zaporke",
    		"loginUsername" => "Korisničko ime",
    		# messages
    		"can't be blank" => "Polje ne smije biti prazno",
    		"is not a number" => "Mora biti broj",
    		"doesn't match Password" => "Mora biti ista kao i zaporka"
    	}
    	if object.errors.messages == nil
    		return
    	end
    	if flash[:alert] == nil
    		flash[:alert] = ""
    	end
    	object.errors.messages.each do |name, errors|
    		error = name.to_s.titleize + ": "
    		if translate[name.to_s] != nil
    			error = translate[name.to_s] + ": "
    		end
    		messages = ""
    		errors.each do |message|
    			if messages.length != 0
    				messages += ", "
    			end
    			if translate[message] == nil
    				messages += message
    			else
    				messages += translate[message]
    			end
    		end
    		flash[:alert] += "<br>" + error + messages
    	end
    end

	def flash_display
  		response = ""
  		flash.each do |name, msg|
  		    response = response + content_tag(:div, msg.html_safe, :id => "flash_#{name}")
  		end
  		flash.discard
  		response
  	end # flash_display
	
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
          role.canViewWorkingHours = true
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
          role.canChangeWorkingHours = true
          role.canChangeStatements = true
          role.canChangeNetworks = true
          role.canChangePages = true
          role.canChangeCategories = true
          #
          role.isDeleteable = false;
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
          role.canViewWorkingHours = true
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
          role.canChangeWorkingHours = true
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
          role.canViewWorkingHours = true
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
          role.canChangeWorkingHours = true
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
          role.canViewWorkingHours = true
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
          role.canChangeWorkingHours = true
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
          role.canViewWorkingHours = true
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
          role.canChangeWorkingHours = true
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
        user.roles << Role.where(:name => "Admin").first
        user.isDeleteable = false
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

      if Vehicle.first == nil
        vehicle = Vehicle.new
        vehicle.vehicleModel        = "Renault Clio"
        vehicle.buildYear           = 1990
        vehicle.vehicleRegistration = "ZG 0001 VP"
        vehicle.save

        vehicle = Vehicle.new
        vehicle.vehicleModel        = "Ford Fiesta"
        vehicle.buildYear           = 2008
        vehicle.vehicleRegistration = "ZG 0002 SK"
        vehicle.save

        vehicle = Vehicle.new
        vehicle.vehicleModel        = "Aston Martin Vanquish"
        vehicle.buildYear           = 2005
        vehicle.vehicleRegistration = "ZG 0003 MP"
        vehicle.save

        vehicle = Vehicle.new
        vehicle.vehicleModel        = "Rolls Royce"
        vehicle.buildYear           = 1989
        vehicle.vehicleRegistration = "ZG 0004 MP"
        vehicle.save

        vehicle = Vehicle.new
        vehicle.vehicleModel        = "Volvo S60"
        vehicle.buildYear           = 2013
        vehicle.vehicleRegistration = "ZG 0005 MS"
        vehicle.save

        vehicle = Vehicle.new
        vehicle.vehicleModel        = "Volkswagen Golf"
        vehicle.buildYear           = 1990
        vehicle.vehicleRegistration = "ZG 0006 MS"
        vehicle.save

        vehicle = Vehicle.new
        vehicle.vehicleModel        = "Lamborgini Avantador"
        vehicle.buildYear           = 2012
        vehicle.vehicleRegistration = "ZG 0007 MS"
        vehicle.save

        vehicle = Vehicle.new
        vehicle.vehicleModel        = "Smart fortwo cupe"
        vehicle.buildYear           = 2004
        vehicle.vehicleRegistration = "ZG 0008 ZL"
        vehicle.save

        vehicle = Vehicle.new
        vehicle.vehicleModel        = "Tesla Roadster"
        vehicle.buildYear           = 2011
        vehicle.vehicleRegistration = "ZG 0009 ZL"
        vehicle.save
      end

      if Client.first == nil
        client = Client.new
        client.nameFirst        = "Vlaho"
        client.nameLast         = "Poluta"
        client.contactAdress    = "Gundulićeva 56a"
        client.contactTelephone = "00385 1 1234 561"
        client.save

        client = Client.new
        client.nameFirst        = "Stanko"
        client.nameLast         = "Krtalić Rusendić"
        client.contactAdress    = "Ilica 122"
        client.contactTelephone = "00385 1 1234 562"
        client.save

        client = Client.new
        client.nameFirst        = "Marin"
        client.nameLast         = "Pogančić"
        client.contactAdress    = "Radićeva 16"
        client.contactTelephone = "00385 1 1234 563"
        client.save

        client = Client.new
        client.nameFirst        = "Martin"
        client.nameLast         = "Sertić"
        client.contactAdress    = "Vukovarska 23a"
        client.contactTelephone = "00385 1 1234 563"
        client.save

        client = Client.new
        client.nameFirst        = "Mateja"
        client.nameLast         = "Škriljak"
        client.contactAdress    = "Petrova 73"
        client.contactTelephone = "00385 1 1234 564"
        client.save

        client = Client.new
        client.nameFirst        = "Mirjam"
        client.nameLast         = "Škarica"
        client.contactAdress    = "Vlaška 43b"
        client.contactTelephone = "00385 1 1234 565"
        client.save

        client = Client.new
        client.nameFirst        = "Zrinka"
        client.nameLast         = "Lekić"
        client.contactAdress    = "Draškovićeva 3"
        client.contactTelephone = "00385 1 1234 565"
        client.save
      end

      if Part.first == nil
        part = Part.new
        part.name        = "Mineralno ulje"
        part.quantity    = 46.3
        part.price       = 42.60
        part.description = "Ulje za motore"
        part.save

        part = Part.new
        part.name        = "Ljetne gume"
        part.quantity    = 14.0
        part.price       = 200.00
        part.description = "Ljetne gume"
        part.save

        part = Part.new
        part.name        = "Zimske gume"
        part.quantity    = 61.0
        part.price       = 236.00
        part.description = "Zimske gume"
        part.save

        part = Part.new
        part.name        = "Zupčasti remen"
        part.quantity    = 361.00
        part.price       = 39.99
        part.description = "Zupčasti remen"
        part.save

        part = Part.new
        part.name        = "Akumulator"
        part.quantity    = 18.00
        part.price       = 289.50
        part.description = "Akumulator 12V 5600Ah"
        part.save

        part = Part.new
        part.name        = "Klip"
        part.quantity    = 2.00
        part.price       = 460.50
        part.description = "Motorni klip"
        part.save

        part = Part.new
        part.name        = "Ispušna cijev"
        part.quantity    = 56.00
        part.price       = 86.99
        part.description = "Auspuh"
        part.save
      end

      if Procedure.first == nil
        procedure = Procedure.new
        procedure.name            = "Zamjena ulja"
        procedure.description     = "Izvadi staro ulje van, ulij novo unutra..."
        procedure.minNumOfWorkers = 1
        procedure.duration        = 1.0
        procedure.manHour         = 32.0
        procedure.save

        procedure = Procedure.new
        procedure.name            = "Postavljanje zimskih guma"
        procedure.description     = "Skini stare gume, uzmi 4 nove zimske i montiraj ih..."
        procedure.minNumOfWorkers = 1
        procedure.duration        = 0.5
        procedure.manHour         = 32.0
        procedure.save

        procedure = Procedure.new
        procedure.name            = "Postavljanje ljetnih guma"
        procedure.description     = "Skini stare gume, uzmi 4 nove ljetne i montiraj ih..."
        procedure.minNumOfWorkers = 1
        procedure.duration        = 0.5
        procedure.manHour         = 32.0
        procedure.save

        procedure = Procedure.new
        procedure.name            = "Popravak motora"
        procedure.description     = "Zamjeni zupčasti remen i 6 klipova"
        procedure.minNumOfWorkers = 4
        procedure.duration        = 6.0
        procedure.manHour         = 80.0
        procedure.save

        procedure = Procedure.new
        procedure.name            = "Zamjena akumulatora"
        procedure.description     = "Baci stari i ugradi novi"
        procedure.minNumOfWorkers = 1
        procedure.duration        = 0.1
        procedure.manHour         = 10.0
        procedure.save

        procedure = Procedure.new
        procedure.name            = "Zamjena auspuha"
        procedure.description     = "Nisam siguran niti ja..."
        procedure.minNumOfWorkers = 2
        procedure.duration        = 2.0
        procedure.manHour         = 50.0
        procedure.save
      end

      if Statement.first == nil
        from_date = Date.new(2012, 1, 1)
        to_date   = Date.yesterday
        h_month   = from_date.month
        h_year    = from_date.year
        (from_date..to_date).each { |d| 
          type = 0
          if d.month > h_month && d.year == h_year
            type = 1
            h_month = d.month
            d = d.last_month
          end
          if d.year > h_year
            type = 2
            h_year = d.year
            h_month = d.month
            d = d.last_year
          end
          statement = Statement.new
          statement.statemnetType = type
          statement.statementDate = d
          statement.money = 1000 + rand(9999)
          statement.save
        }
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

	def authUserFor(controllerName, editOrView="view")
		authUser
		if currentUser != nil && editOrView == "edit" && currentUser.canEdit(controllerName) == false
			render "sessions/new"
		end
		if currentUser != nil && editOrView == "view" && currentUser.canView(controllerName) == false
			render "sessions/new"
		end
	end # authUserFor
	
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
