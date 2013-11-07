class Tag < ActiveRecord::Base
  attr_accessible :name, :blog_id
	belongs_to :blog
end
