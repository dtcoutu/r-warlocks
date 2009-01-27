Given /^I am not logged in$/ do
	assert_nil session[:user]
	session[:user].should be_nil
end

Given /^I am logged in as "(.*)"$/ do |user|
	visits "/registration/new"
	fill_in :username, :with => user
	fill_in :password, :with => 'passw0rd'
	click_button "Register"
end

When /^I login as "(.*)"$/ do |username|
	fill_in :username, :with => username
	fill_in :password, :with => 'passw0rd'
	click_button 'Login'
end

When /^I enter an incorrect password$/ do
	fill_in :username, :with => 'duplicate'
	fill_in :password, :with => 'notright'
	click_button 'Login'
end
