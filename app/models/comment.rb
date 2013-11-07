class Comment < ActiveRecord::Base
  attr_accessible :blog_id, :content, :name
	belongs_to :blog
	
	validates_presence_of :name, :content, :blog_id
	#validates_uniqueness_of :name
	validates :blog_id, numericality:{only_integer: true}
end
