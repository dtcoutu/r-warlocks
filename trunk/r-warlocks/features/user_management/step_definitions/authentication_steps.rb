# Need to pull higher
Given /^I am logged out$/ do
end

Given /^I am on the start page$/ do
	visits "/registration/show"
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

# Need to abstract and pull higher
Then /^I will be directed to the start page$/ do
	request.path.to_s.should eql('/player/list')
end

# Need to abstract and pull higher - page_confirmation_steps.rb
Then /^I will stay on the login page$/ do
	request.path.to_s.should eql('/registration/login')
end

Then /^be presented with an error message$/ do
	response.should have_text(/id="errorExplanation"/)
end
