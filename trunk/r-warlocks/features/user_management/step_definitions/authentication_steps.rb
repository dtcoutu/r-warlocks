Given /^I am not logged in$/ do
	assert_nil session[:user]
	session[:user].should be_nil
end

Given /^I am logged in as "(.*)"$/ do |username|
	user = User.find_by_username(username)
	if (user.nil?)
		visit "/registration/new"
		fill_in :username, :with => username
		fill_in :password, :with => 'passw0rd'
		click_button "Register"
	else
		session[:user] = user
	end
end

When /^I login as "(.*)"$/ do |username|
	visit "/registration/login"
	fill_in :username, :with => username
	fill_in :password, :with => 'passw0rd'
	click_button 'Login'
end

When /^I enter an incorrect password$/ do
	fill_in :username, :with => 'duplicate'
	fill_in :password, :with => 'notright'
	click_button 'Login'
end
