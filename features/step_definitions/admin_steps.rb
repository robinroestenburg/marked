Given "there are published posts" do
  Post.create!(title: 'Foo')
  Post.create!(title: 'Bar')
end

Given "there is an unpublished post" do
  File.open(File.join(::Rails.root, "app/posts/foo.markdown"), "w") do |f|
    f.write("Example Markdown post.")
  end
end

When "I visit the posts page" do
  visit posts_path
end

When "I publish the unpublished post" do
  click_link "Publish"
end

Then "I should see a list with published posts" do
  page.should have_selector("table.published_posts tr.post", count: 2)
end

Then "I should see the post in the published posts list" do
  page.should have_selector("table.published_posts tr.post", count: 1)
end
