
Given /^I am on the "(.*)" page$/ do |page|
	visits page
end

When /^I click the "(.*)" link$/ do |link|
	click_link link
end

Then /^I will be directed to the "(.*)" page$/ do |page|
	request.path.to_s.should eql(page)
end

Then /^I will stay on the "(.*)" page$/ do |page|
	request.path.to_s.should eql(page)
end

Then /^I will see "(.*)" on the page$/ do |content|
	request.should have_tag("p", content)
end

Then /^be shown an error message$/ do
	response.should have_text(/id="errorExplanation"/)
end
