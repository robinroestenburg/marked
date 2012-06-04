class RetrievesUnpublishedPosts

  class << self

    def all
      dir = Dir.glob(File.join(::Rails.root, "app/posts", "*"))

      dir.collect do |file_name|
        Post.new(title: file_name)
      end

    end

  end

end
