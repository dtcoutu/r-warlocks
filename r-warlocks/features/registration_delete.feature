Feature: User registration deletion
	As a user
	I want to unregister
	So I no longer have data in the system
	
	Scenario: Unregister a username
		Given I am logged in as "testUser"
		When I delete my account
		Then "testUser" account information will be removed
		And I will be directed to the "/registration/show" page
