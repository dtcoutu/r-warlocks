Given /^I am not logged in$/ do
	assert_nil session[:user]
	session[:user].should be_nil
end

Given /^I am logged in as "(.*)"$/ do |user|
	visits "/registration/new"
	fill_in :userid, :with => user
	fill_in :password, :with => 'passw0rd'
	click_button "Register"
end

# Need to pull higher - consider combining with login link...
When /^I login as "(.*)"$/ do |userid|
	fill_in :userid, :with => userid
	fill_in :password, :with => 'passw0rd'
	click_button 'Login'
end

When /^I enter an incorrect password$/ do
	fill_in :userid, :with => 'duplicate'
	fill_in :password, :with => 'notright'
	click_button 'Login'
end

Then /^be presented with an error message$/ do
	response.should have_text(/id="errorExplanation"/)
end
