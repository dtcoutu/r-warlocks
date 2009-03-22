Feature: Leaving a challenge
	As a warlock
	I want to be able to leave a challenge that hasn't started yet
	So that I can avoid having to play that challenge
	
	Scenario: Leaving a challenge when I'm the only warlock who has accepted the challenge
		Given I am logged in as "testUser"
		And I have selected the warlock "testWarlock"
		And a challenge was created by "testWarlock" for "2" players
		And I am on the "/challenge/list" page
		When I click on "Leave" for the challenge
		Then the warlock "testWarlock" should see "0" open challenges
	
	Scenario: Leaving a challenge with invited warlocks when I'm the only warlock who has accepted the challenge
		Given I am logged in as "testUser"
		And I have selected the warlock "testWarlock"
		And a challenge was created by "testWarlock" for "2" players with "otherWarlock1" invited
		And I am on the "/challenge/list" page
		When I click on "Leave" for the challenge
		Then the warlock "testWarlock" should see "0" open challenges
		
	Scenario: The only joined warlock leaves a challenge that I have been invited to
		Given I am logged in as "testUser"
		And I have selected the warlock "testWarlock"
		And a challenge was created by "otherWarlock1" for "2" players with "testWarlock" invited
		When "otherWarlock1" leaves the challenge they created
		Then the warlock "testWarlock" should see "0" open challenges
	
	Scenario: Leaving a challenge when other warlocks have also accepted the challenge
		Given I am logged in as "testUser"
		And I have selected the warlock "testWarlock"
		And a challenge was created by "testWarlock" for "3" players with "otherWarlock1" joined
		And I am on the "/challenge/list" page
		When I click on "Leave" for the challenge
		Then the warlock "testWarlock" should see "1" open challenges
		And the warlock "otherWarlock1" should see "1" pending challenges
		
	