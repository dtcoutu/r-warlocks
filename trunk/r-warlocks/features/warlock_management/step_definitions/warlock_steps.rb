When /^I create a warlock named "(.*)"$/ do |name|
	fill_in :name, :with => name
	click_button "Create"
end