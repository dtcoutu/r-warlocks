Given /^a registered user "(.*)" exists$/ do |username|
	user = User.new(:username => username, :password => 'passw0rd')
	user.save
end

When /^I create a new account "(.*)"$/ do |username|
	visits "/registration/new"
	fill_in :username, :with => username
	fill_in :password, :with => 'passw0rd'
	click_button "Register"
end
