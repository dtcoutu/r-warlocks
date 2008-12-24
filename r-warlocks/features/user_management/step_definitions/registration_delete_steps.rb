Given /^I am logged in$/ do
	Fixtures.create_fixtures("test/fixtures", "users")
	#session[:user] = users(:duplicate)
end

When /^I delete my account$/ do
	visits "/registration/delete"
end

Then /^my account information will be removed$/ do
end

Then /^I will be redirected to a thank you page$/ do
	request.path.should eql("/registration/thank_you")
end
