class SetDefaultCountValues < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :total_likes_count, :integer, default: 0
    change_column :posts, :total_comments_count, :integer, default: 0
  end
end
