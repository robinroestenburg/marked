class RetrievesUnpublishedPosts

  class << self

    def all
      raw_posts.collect! do |file_name|
        Post.new(title: file_name)
      end

    end

    def raw_posts
      dir = Dir.new(File.join(::Rails.root, "app/posts"))
      dir.reject { |f| f.starts_with? "." }
    end

  end

end
