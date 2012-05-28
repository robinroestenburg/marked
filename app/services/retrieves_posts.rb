class RetrievesPosts

  class << self

    def all
      published + unpublished
    end

    def published
      Post.all
    end

    def unpublished
      RetrievesUnpublishedPosts.all
    end

  end
end
