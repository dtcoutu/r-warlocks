Given /^"(.*)" has "(\d)" warlocks$/ do |userid, limit|
	user = User.find_by_userid(userid)
	count = 1
	while (count <= limit.to_i) do
		warlock = Warlock.new(:name => 'warlock' + count.to_s, :user_id => user.id)
		warlock.save
		count += 1
	end
end

When /^I create a warlock named "(.*)"$/ do |name|
	fill_in :name, :with => name
	click_button "Create"
end