Given /^"(.*)" has "(\d)" warlocks$/ do |username, limit|
	user = User.find_by_username(username)
	count = 1
	while (count <= limit.to_i) do
		warlock = Warlock.new(:name => 'warlock' + count.to_s, :user_id => user.id)
		warlock.save
		count += 1
	end
end

Given /^a warlock named "(.*)" exists$/ do |warlock_name|
	warlock = Warlock.new(:name => warlock_name, :user_id => 1)
	warlock.save
end

When /^I create a warlock named "(.*)"$/ do |name|
	fill_in :name, :with => name
	click_button "Create"
end

Then /^I will see the warlock "(.*)" listed on the page$/ do |warlock_name|
	response.should have_tag("div.warlock-summary", :text => "Rasper")
end