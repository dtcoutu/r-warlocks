Feature: User authentication
	As a user
	I want to login
	So that I can select/create Warlocks and play the game
	
	Scenario: User Login
		Given a registered user "testUser" exists
		And I am on the "/registration/show" page
		And I am not logged in
		When I click the "Login" link
		And I login as "testUser"
		Then I will be directed to the "/player/list" page
	
	Scenario: User failed login
		Given I am on the "/registration/show" page
		And I am not logged in
		When I click the "Login" link
		And I enter an incorrect password
		Then I will stay on the "/registration/login" page
		And be presented with an error message
