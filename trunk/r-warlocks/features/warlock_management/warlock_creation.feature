Feature: Warlock creation
	As a user
	I want to create a warlock
	So I can join matches with it
	
	Scenario: Create a unique warlock
		Given I am logged in as "testUser"
		And I am on the "/player/list" page
		When I click the "Create Warlock" link
		And I create a warlock named "Rasper"
		Then I will be directed to the "/player/list" page
