Feature: Show all warlocks for a user
	As a user
	I want to see a list of all warlocks I have created
	So I can view their stats
	
	Scenario: List all warlocks for a player
		Given I am logged in as "testUser"
		And I am on the "/player/list" page
		And I have "3" warlocks
		When I click on the "view warlocks" link
		Then I will be directed to the "/warlock/list" page
