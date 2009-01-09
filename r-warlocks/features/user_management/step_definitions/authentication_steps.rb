Given /^I am logged out$/ do
end

Given /^I am logged in as "(.*)"$/ do |user|
	visits "/registration/new"
	fill_in :userid, :with => user
	fill_in :password, :with => 'passw0rd'
	click_button "Register"
end

When /^I click the login link$/ do
	Fixtures.create_fixtures("test/fixtures", "users")
	click_link "login"
end

# Need to pull higher - consider combining with login link...
When /^I login$/ do
	fill_in :userid, :with => 'duplicate'
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
