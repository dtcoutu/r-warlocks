When /^I create a challenge for "(\d)" warlocks$/ do |num_challengers|
	fill_in "match[num_challengers]", :with => num_challengers
	click_button "Create"
end

When /^I create a challenge for "(\d)" warlocks specifying the opponents "(.*)"$/ do |num_challengers, challenger_names|
	challenger_list = challenger_names.split(", ")
	fill_in "match[num_challengers]", :with => num_challengers
	# Need to have another join table for keeping track of invitedChallengers between Match and warlocks
	fill_in "invited_challengers[1][warlock_name]", :with => challenger_list[0]
	fill_in "invited_challengers[2][warlock_name]", :with => challenger_list[1]
	
	click_button "Create"
end

Then /^I will see a challenge in the waiting for challenger list$/ do
	response.should have_tag("ul.waitingForChallengers")
end

Then /^"(.*)" will be shown as opponents$/ do |challenger_names|
	challenger_list = challenger_names.split(", ")
	response.should have_tag("ul.waitingForChallengers") do
		with_tag("span.invite", challenger_list[0])
		with_tag("span.invite", challenger_list[1])
	end
end
