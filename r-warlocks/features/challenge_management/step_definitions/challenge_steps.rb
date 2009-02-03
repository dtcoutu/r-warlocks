When /^I create a challenge for "(.*)" warlocks$/ do |num_challengers|
	fill_in "challenge[num_challengers]", :with => num_challengers
	click_button "Create"
end