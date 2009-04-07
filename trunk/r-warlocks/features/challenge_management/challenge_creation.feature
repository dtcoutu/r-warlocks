Feature: Challenge creation
	As a warlock
	I want to be able to create a challenge
	So that I can play against another warlock
	
#	open challenge
#	specify warlocks to challenge
#	number of warlocks
#	different match options (parafc, maladroit, etc...)
#	
#	Scenario: Create a 2-player challenge specifying the other warlock
#	
	Scenario: Create an open challenge for 2 warlocks
		Given I am logged in as "testUser"
		And I have selected the warlock "testWarlock"
		And I am on the "/game/list" page
		When I click the "Create Challenge" link
		And I create a challenge for "2" warlocks
		Then I will be directed to the "/game/list" page
		And I will see a challenge in the waiting for challenger list
	
	Scenario: Create a challenge for 3 warlocks specifying their names
		Given I am logged in as "testUser"
		And I have selected the warlock "testWarlock"
		And a warlock named "otherWarlock1" exists
		And a warlock named "otherWarlock2" exists
		And I am on the "/game/list" page
		When I click the "Create Challenge" link
		And I create a challenge for "3" warlocks specifying the opponents "otherWarlock1, otherWarlock2"
		Then I will be directed to the "/game/list" page
		And I will see a challenge in the waiting for challenger list
		And "otherWarlock1, otherWarlock2" will be shown as opponents