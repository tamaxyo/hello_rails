class SetCommentDefaultStatus < ActiveRecord::Migration[5.0]
  def change
    change_column :comments, :status, :string, :default => 'unapproved'
  end
end
