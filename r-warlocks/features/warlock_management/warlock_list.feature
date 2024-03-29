Feature: Show all warlocks for a user
	As a user
	I want to see a list of all warlocks I have created
	So I can view their stats
	
	Scenario: List all warlocks for a player
		Given a registered user "testUser" exists
		And "testUser" has "3" warlocks
		And I login as "testUser"
		And I am on the "/player/list" page
		When I click the "Manage Warlocks" link
		Then I will be directed to the "/player/manage" page
		And I will see "3" warlocks for user "testUser"
		
	Scenario: Ensure only warlocks for the current player are listed
		Given a registered user "testUser" exists
		And "testUser" has "2" warlocks
		And a registered user "otherUser" exists
		And "otherUser" has "3" warlocks
		And I login as "testUser"
		And I am on the "/player/list" page
		When I click the "Manage Warlocks" link
		Then I will be directed to the "/player/manage" page
		And I will see "2" warlocks for user "testUser"
