class AddBlogIdToTags < ActiveRecord::Migration
  def change
    add_column :tags, :blog_id, :integer
  end
end
