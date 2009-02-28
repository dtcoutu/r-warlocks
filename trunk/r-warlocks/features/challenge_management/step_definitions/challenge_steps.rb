When /^I create a challenge for "(.*)" warlocks$/ do |num_challengers|
	fill_in "match[num_challengers]", :with => num_challengers
	click_button "Create"
end

Then /^I will see a challenge waiting for challenger listed$/ do

end