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
			# models
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
			"orderProcedures" => "Postupci",
			"order_procedures" => "Postupci",
			"order_parts" => "Dijelovi",
			"order_parts.quantity" => "Količina dijelova",
			"price" => "Cijena",
			"quantity" => "Količina",
			"timeFinish" => "Vrijeme Završetka",
			# messages
			"can't be blank" => "Polje ne smije biti prazno",
			"is not a number" => "Mora biti broj",
			"doesn't match Password" => "Mora biti ista kao i zaporka",
			"is too short (minimum is 1 characters)" => "Premalo (minimum je 1 postupak)",
			"is invalid" => "Nije valjana"
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
