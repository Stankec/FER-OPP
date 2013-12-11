# encoding: UTF-8
class Category < ActiveRecord::Base
	has_ancestry
	extend FriendlyId
  	friendly_id :title, use: :slugged
end
