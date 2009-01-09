Given /^a registered user "duplicate" exists$/ do
	visits "/registration/new"
	fill_in :userid, :with => 'duplicate'
	fill_in :password, :with => 'passw0rd'
	click_button "Register"
end

When /^I create a new account$/ do
	visits "/registration/new"
	fill_in :userid, :with => 'newUser'
	fill_in :password, :with => 'passw0rd'
	click_button "Register"
end

When /^I create a duplicate account$/ do
	visits "/registration/new"
	fill_in :userid, :with => 'duplicate'
	fill_in :password, :with => 'passw0rd'
	click_button "Register"
end

Then /^I will be shown an error$/ do
	request.path.to_s.should eql('/registration/new')
end
