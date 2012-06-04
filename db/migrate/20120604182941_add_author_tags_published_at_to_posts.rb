class AddAuthorTagsPublishedAtToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :author, :string
    add_column :posts, :tags, :string
    add_column :posts, :published_at, :timestamp
  end
end
