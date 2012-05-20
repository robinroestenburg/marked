Given /^I have a Foo$/ do
  @foo = Foo.new
end

When /^I call method 'bar'$/ do
  @result = @foo.bar
end

Then /^it will return true$/ do
  @result.should == true
end
