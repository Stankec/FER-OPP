# encoding: UTF-8
class User < ActiveRecord::Base

	attr_accessor :password, :password_confirmation
	before_save :encrypt_password

	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :loginUsername
	validates_uniqueness_of :loginUsername

	before_create { generate_token(:loginAuthToken) }
  
	def authenticate(name, password)
	  	user = User.find_by loginUsername: name
	  	if user && user.loginPasswordHash == BCrypt::Engine.hash_secret(password, user.loginPasswordSalt)
	  	  	return user
	  	else
	  	  	return nil
	  	end
	end
  
	def encrypt_password
	  if password.present?
	    	self.loginPasswordSalt = BCrypt::Engine.generate_salt
	    	self.loginPasswordHash = BCrypt::Engine.hash_secret(password, loginPasswordSalt)
	  end
	end

  	def generate_token(column)
	  	begin
	    	self[column] = SecureRandom.urlsafe_base64
	  	end while User.exists?(column => self[column])
	end

end
