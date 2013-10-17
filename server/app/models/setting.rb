# encoding: UTF-8
class Setting < ActiveRecord::Base
	belongs_to :pageFavicon, :class_name => 'Image'
	belongs_to :pagePreview, :class_name => 'Image'
end
