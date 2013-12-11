# encoding: UTF-8
class User < ActiveRecord::Base
	# to-Many relationship
	has_and_belongs_to_many :roles

	# Password encription
	attr_accessor :password, :password_confirmation
	before_save :encrypt_password

	# Form validation
	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :loginUsername
	validates_uniqueness_of :loginUsername

	before_create { generate_token(:loginAuthToken) }
  
  	# Methods

  	# Decrypt password and check it
	def authenticate(name, password)
	  	user = User.find_by loginUsername: name
	  	if user && user.loginPasswordHash == BCrypt::Engine.hash_secret(password, user.loginPasswordSalt)
	  	  	return user
	  	else
	  	  	return nil
	  	end
	end
  
  	# Encrypt password
	def encrypt_password
	  if password.present?
	    	self.loginPasswordSalt = BCrypt::Engine.generate_salt
	    	self.loginPasswordHash = BCrypt::Engine.hash_secret(password, loginPasswordSalt)
	  end
	end

	# generate authentification token
  	def generate_token(column)
	  	begin
	    	self[column] = SecureRandom.urlsafe_base64
	  	end while User.exists?(column => self[column])
	end

end
