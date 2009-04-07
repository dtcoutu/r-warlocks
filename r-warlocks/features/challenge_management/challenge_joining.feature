Feature: Joining an existing challenge
	As a warlock
	I want to be able to join a challenge
	So that I may play against another warlock
	
	Scenario: Joining a challenge with only one open place left.
		Given a warlock named "otherWarlock" exists
		And a challenge was created by "otherWarlock" for "2" players
		And I am logged in as "testUser"
		And I have selected the warlock "testWarlock"
		And I am on the "/game/list_open" page
		When I click on "Join" for the challenge that "otherWarlock" created
		Then I will be directed to the "/game/list" page
		And I will see a challenge in the ready list
	
	Scenario: Joining a challenge for which there are other open spots
		Given a warlock named "otherWarlock" exists
		And a challenge was created by "otherWarlock" for "3" players
		And I am logged in as "testUser"
		And I have selected the warlock "testWarlock"
		And I am on the "/game/list_open" page
		When I click on "Join" for the challenge that "otherWarlock" created
		Then I will be directed to the "/game/list" page
		And I will see a challenge in the waiting for challenger list
