class Post < ActiveRecord::Base
  attr_accessible :title, :author, :published_at, :tags
end
