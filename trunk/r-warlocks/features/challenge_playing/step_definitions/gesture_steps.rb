Given /^I am in a challenge with "([^\"]*)" that is in the started state$/ do |warlock|
  Given "a warlock named \"#{warlock}\" exists"
  warlock = session[:warlock]
  Given "a challenge was created by \"#{warlock.name}\" for \"2\" players with \"#{warlock}\" joined"
end

When /^I submit "([^\"]*)" and "([^\"]*)" for gestures$/ do |left_hand, right_hand|
  pending
end
