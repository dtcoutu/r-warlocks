When /^I create a challenge for "(\d)" warlocks$/ do |num_challengers|
	fill_in "match[num_challengers]", :with => num_challengers
	click_button "Create"
end

When /^I create a challenge for "(\d)" warlocks specifying the opponents "(.*)"$/ do |num_challengers, challengerNames|
	challengerList = challengerNames.split(", ")
	fill_in "match[num_challengers]", :with => num_challengers
	# Need to have another join table for keeping track of invitedChallengers between Match and warlocks
	fill_in "invited_challengers[1][warlock_name]", :with => challengerList[0]
	fill_in "invited_challengers[2][warlock_name]", :with => challengerList[1]
	
	click_button "Create"
end

Then /^I will see a challenge in the waiting for challenger list$/ do
	response.should have_tag("ul.waitingForChallengers")
end