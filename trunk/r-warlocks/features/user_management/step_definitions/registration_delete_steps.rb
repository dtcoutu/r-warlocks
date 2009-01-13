
When /^I delete my account$/ do
	visits "/registration/delete"
end

Then /^"(.*)" account information will be removed$/ do |userid|
	user = User.find_by_userid(userid)
	assert_nil user
end
