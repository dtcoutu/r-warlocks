Given /^"(.*)" has "(\d)" warlocks$/ do |userid, limit|
	count = 1
	while (count <= limit.to_i) do
		warlock = Warlock.new(:name => 'warlock' + count.to_s, :userid => userid)
		warlock.save
		count += 1
	end
end

When /^I create a warlock named "(.*)"$/ do |name|
	fill_in :name, :with => name
	click_button "Create"
end