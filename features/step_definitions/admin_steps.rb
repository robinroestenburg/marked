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

  fill_in "Author", with: "Me, myself & I"
  fill_in "Tags",   with: "rails rspec"

  select "2012",    from: "post_published_at_1i"
  select "January", from: "post_published_at_2i"
  select "1",       from: "post_published_at_3i"
  select "13",      from: "post_published_at_4i"
  select "37",      from: "post_published_at_5i"

  save_and_open_page
  click_button "Publish"
end

Then "I should see a list with published posts" do
  page.should have_selector("table.published_posts tr.post", count: 2)
end

Then "I should see the post in the published posts list" do
  save_and_open_page
  page.should have_selector("table.published_posts tr.post", count: 1)
end
