Given /^a challenge was created by "(.*)" for "(\d)" players$/ do |warlock, num_challengers|
	Given "a warlock named \"#{warlock}\" exists"
	match = Match.new(:num_challengers => num_challengers)
	warlock = Warlock.find_by_name(warlock)
	match.warlocks<< warlock
	
	match.save
end

Given /^a challenge was created by "(.*)" for "(\d)" players with "(.*)" invited$/ do |warlock, num_challengers, invited_warlocks_string|
	Given "a challenge was created by \"#{warlock}\" for \"#{num_challengers}\" players"
	warlock = Warlock.find_by_name(warlock)
	match = warlock.matches.last
	invited_warlocks = invited_warlocks_string.split(", ")
	for invited_warlock in invited_warlocks
		Given "a warlock named \"#{invited_warlock}\" exists"
		current_warlock = Warlock.find_by_name(invited_warlock)
		match.invited_warlocks << current_warlock
	end
end

Given /^a challenge was created by "(.*)" for "(\d)" players with "(.*)" joined$/ do |warlock, num_challengers, joined_warlocks_string|
	Given "a challenge was created by \"#{warlock}\" for \"#{num_challengers}\" players"
	warlock = Warlock.find_by_name(warlock)
	match = warlock.matches.last
	joined_warlocks = joined_warlocks_string.split(", ")
	for joined_warlock in joined_warlocks
		Given "a warlock named \"#{joined_warlock}\" exists"
		current_warlock = Warlock.find_by_name(joined_warlock)
		match.warlocks << current_warlock
	end
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

When /^I click on "(.*)" for the challenge that "(.*)" created$/ do |click_action, warlock_name|
	# not sure what the within part should be?
	#warlock = Warlock.find_by_name(warlock_name)
	#matches = warlock.matches
	#click_link_within "#challenge_" + matches[0].id.to_s , "Join"
	click_link click_action
end

When /^I click on "(.*)" for the challenge$/ do |click_action|
	click_link click_action
end

When /^"(.*)" leaves the challenge they created$/ do |warlock_name|
	warlock = Warlock.find_by_name(warlock_name)
	match = warlock.matches.last
	match.leave(warlock)
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

Then /^the warlock "(.*)" should see "(\d)" open challenges$/ do |warlock_name, num_challenges|
	warlock = Warlock.find_by_name(warlock_name)
	open_matches = Match.find_open_for_warlock(warlock)
	
	assert_equal num_challenges.to_i, open_matches.size
end

Then /^the warlock "(.*)" should see "(\d)" pending challenges$/ do |warlock_name, num_challenges|
	warlock = Warlock.find_by_name(warlock_name)
	pending_challenges = warlock.matches.find_all_by_status("Open")
	
	assert_equal num_challenges.to_i, pending_challenges.size
end
