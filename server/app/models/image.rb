# encoding: UTF-8
class Image < ActiveRecord::Base
	mount_uploader :path, ImageUploader
end
