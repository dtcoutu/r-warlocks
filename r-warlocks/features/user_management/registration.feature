Feature: User registration
	As a user
	I want to register
	So I can play the game and save my state
	
	Scenario: Register a unique userid
		Given I am logged out
		When I create a new account
		Then I will be directed to the "/player/list" page
	
	Scenario: Attempt to register a non-unique userid
		Given I am logged out
		And a registered user "duplicate" exists
		When I create a duplicate account
		Then I will be shown an error