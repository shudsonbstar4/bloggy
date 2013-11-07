class Blog < ActiveRecord::Base
  attr_accessible :content, :title
	has_many :comments
	has_many :tags
	
	validates_presence_of :title, :content
end
