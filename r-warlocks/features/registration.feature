Feature: User registration
	As a user
	I want to register
	So I can play the game and save my state
	
	Scenario: Register a unique username
		Given I am on the "/registration/show" page
		And I am not logged in
		When I create a new account "testUser"
		Then I will be directed to the "/player/list" page
		And I will see "Info for testUser" on the page
	
	Scenario: Attempt to register a non-unique username
		Given I am on the "/registration/show" page
		And I am not logged in
		And a registered user "duplicate" exists
		When I create a new account "duplicate"
		Then be shown an error message