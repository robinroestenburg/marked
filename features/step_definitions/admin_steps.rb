Given "there are published posts" do
  Post.create!(title: 'Foo')
  Post.create!(title: 'Bar')
end

When "I visit the admin posts page" do
  visit posts_path
end

Then "I should see a list with published posts" do
  page.should have_selector("table.posts tr.post", count: 2)
end
