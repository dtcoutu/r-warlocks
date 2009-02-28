
When /^I delete my account$/ do
	visit "/registration/delete"
end

Then /^"(.*)" account information will be removed$/ do |username|
	user = User.find_by_username(username)
	assert_nil user
end
