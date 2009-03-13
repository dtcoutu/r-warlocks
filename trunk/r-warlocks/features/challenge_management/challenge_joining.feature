Feature: Joining an existing challenge
	As a warlock
	I want to be able to join a challenge
	So that I may play against another warlock
	
	Scenario: Joining a match with only one open place left.
		Given a warlock named "otherWarlock" exists
		And a challenge for "2" players was created by "otherWarlock"
		And I am logged in as "testUser"
		And I have selected the warlock "testWarlock"
		And I am on the "/challenge/list_open" page
		When I click on "Join" for the match created by "otherWarlock"
		Then I will be directed to the "/challenge/list" page
		And I will see a challenge in the ready list
	
	Scenario: Joining a match for which there are other open spots
		Given a warlock named "otherWarlock" exists
		And a challenge for "3" players was created by "otherWarlock"
		And I am logged in as "testUser"
		And I have selected the warlock "testWarlock"
		And I am on the "/challenge/list_open" page
		When I click on "Join" for the match created by "otherWarlock"
		Then I will be directed to the "/challenge/list" page
		And I will see a challenge in the waiting for challenger list
