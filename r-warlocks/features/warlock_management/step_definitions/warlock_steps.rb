Given /^"(.*)" has "(\d)" warlocks$/ do |username, limit|
	user = User.find_by_username(username)
	count = 1
	while (count <= limit.to_i) do
		warlock = Warlock.new(:name => username + '-warlock' + count.to_s, :user_id => user.id)
		if (warlock.save)
			count += 1
		end
	end
end

Given /^a warlock named "(.*)" exists$/ do |warlock_name|
	warlock = Warlock.new(:name => warlock_name, :user_id => 1920)
	warlock.save
end

Given /^I have selected the warlock "(.*)"$/ do |warlock_name|
	visit "/player/create"
	fill_in :name, :with => warlock_name
	click_button "Create"
	
	visit "/player/manage"
	click_link warlock_name
end

When /^I create a warlock named "(.*)"$/ do |name|
	fill_in :name, :with => name
	click_button "Create"
end

Then /^I will see the warlock "(.*)" listed on the page$/ do |warlock_name|
	response.should have_tag("div.warlock-summary", :text => "Rasper")
end

Then /^I will see "(\d)" warlocks for user "(.*)"$/ do |warlock_count, username|
	count = 1
	while (count <= warlock_count.to_i) do
		response.should have_tag("a", :text => username + "-warlock" + count.to_s)
		count += 1
	end
end