# encoding: UTF-8
class Page < ActiveRecord::Base
	belongs_to :category
	acts_as_taggable
	extend FriendlyId
	friendly_id :slug, use: :slugged
	scope :by_join_date, order("created_at DESC")

	validates_presence_of :title

	def self.search(searchTerm)
		if searchTerm
			result = Array.new
			terms = searchTerm.strip.split(" ")

			tempTerms = terms
			terms = Array.new
			tempTerms.each do |term|
				terms += term.strip.split(",")
			end

			# Optimistic search
			# Search tags
			#Rails.logger.info "SEARCH - Terms: " + terms.count.to_s + ";"
			#Rails.logger.info "SEARCH - By tags: " + Page.tagged_with(terms, :any => true).count.to_s + ";"
			return Page.tagged_with(terms, :any => true)

			# Search for full term
			#result = result + find(:all, :conditions => ['title LIKE ?', "%#{searchTerm}%"])
			#result = result + find(:all, :conditions => ['contentPreview LIKE ?', "%#{searchTerm}%"])
			#result = result + find(:all, :conditions => ['content LIKE ?', "%#{searchTerm}%"])

			# Search for partial term
			#terms.each do |term|
			#	result = result + find(:all, :conditions => ['title LIKE ?', "%#{term}%"])
			#	#result = result + find(:all, :conditions => ['contentPreview LIKE ?', "%#{term}%"])
			#	#result = result + find(:all, :conditions => ['content LIKE ?', "%#{term}%"])
			#end

			# Pesimistic Search
			#if result.count == 0
			#	result = result + find(:all, :conditions => ['title LIKE ?', "%#{searchTerm}%"])
			#  	result = result + find(:all, :conditions => ['contentPreview LIKE ?', "%#{searchTerm}%"])
			#  	result = result + find(:all, :conditions => ['content LIKE ?', "%#{searchTerm}%"])
			#  	# Search for partial term
			#  	terms.each do |term|
			#  		#result = result + find(:all, :conditions => ['title LIKE ?', "%#{term}%"])
			#  		result = result + find(:all, :conditions => ['contentPreview LIKE ?', "%#{term}%"])
			#  		result = result + find(:all, :conditions => ['content LIKE ?', "%#{term}%"])
			#  	end
			#end

			# Return
			#return result.uniq!
		else
			return find(:all)
		end
	end # search
end
