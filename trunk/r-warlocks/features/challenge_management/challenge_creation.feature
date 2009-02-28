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
	Scenario: Create an open 2-warlock challenge
		Given I am logged in as "testUser"
		And I have selected the warlock "testWarlock"
		And I am on the "/challenge/list" page
		When I click the "Create Challenge" link
		And I create a challenge for "2" warlocks
		Then I will be directed to the "/challenge/list" page
		And I will see a challenge waiting for challenger listed
	