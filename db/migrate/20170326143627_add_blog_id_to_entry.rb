class AddBlogIdToEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :blog_id, :integer
  end
end
