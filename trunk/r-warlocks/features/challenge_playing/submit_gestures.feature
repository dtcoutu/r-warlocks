Feature: Submitting gestures
	As a warlock
	I must be able to submit gestures
	So that I can cast spells at my opponents
	
	Scenario: Submitting the first gestures
		Given I am logged in as "testUser"
		And I have selected the warlock "testWarlock"
		And I am in a challenge with "otherWarlock" that is in the started state
		#And all warlocks are ready for orders - don't know how I'd represent - other than I haven't given them any gestures
		And I am on the "/challenge/show" page
		When I submit "P" and "D" for gestures
		Then I will be directed to the "/challenge/list" page
		And see the message "Orders submitted" displayed
