Given /^a challenge for "(\d)" players was created by "(.*)"$/ do |num_challengers, warlock|
	Given "a warlock named \"#{warlock}\" exists"
	match = Match.new(:num_challengers => num_challengers)
	warlock = Warlock.find_by_name(warlock)
	match.warlocks<< warlock
	
	match.save
end

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

When /^I click on "(.*)" for the match created by "(.*)"$/ do |click_action, warlock_name|
	# not sure what the within part should be?
	#warlock = Warlock.find_by_name(warlock_name)
	#matches = warlock.matches
	#click_link_within "#challenge_" + matches[0].id.to_s , "Join"
	click_link "Join"
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

Then /^I will see a challenge in the ready list$/ do
	response.should have_tag("ul.readyMatches")
end