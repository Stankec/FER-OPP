class Role < ActiveRecord::Base
	# to-Many relationship
	has_and_belongs_to_many :users
end
