class RetrievesPosts

  class << self

    def all
      (published + unpublished).uniq do |post| 
        post.title
      end
    end

    def published
      Post.all
    end

    def unpublished
      RetrievesUnpublishedPosts.all
    end

  end
end
