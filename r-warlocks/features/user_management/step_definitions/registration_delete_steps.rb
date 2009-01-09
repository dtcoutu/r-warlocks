Given /^I am logged in as "testUser"$/ do
	visits "/registration/new"
	fill_in :userid, :with => 'testUser'
	fill_in :password, :with => 'passw0rd'
	click_button "Register"
end

When /^I delete my account$/ do
	visits "/registration/delete"
end

Then /^my account information will be removed$/ do
end

Then /^I will be redirected to a thank you page$/ do
	request.path.should eql("/registration/show")
end
