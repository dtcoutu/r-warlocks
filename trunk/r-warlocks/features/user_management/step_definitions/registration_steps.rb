Given /^a registered user "(.*)" exists$/ do |userid|
	user = User.new(:userid => userid, :password => 'passw0rd')
	user.save
end

When /^I create a new account "(.*)"$/ do |userid|
	visits "/registration/new"
	fill_in :userid, :with => userid
	fill_in :password, :with => 'passw0rd'
	click_button "Register"
end

Then /^I will be shown an error$/ do
	request.path.to_s.should eql('/registration/new')
end
