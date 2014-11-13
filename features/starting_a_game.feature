Feature: Starting the game
	In order to play battleships
	As a nostalgic player
	I want to start a new game

	Scenario: Registering the first player
		Given I am on the homepage
		When I follow "New Game"
		Then I should see "What is your name?"
		When I input my name and click "submit"
		Then I should see a page that welcomes me to Battleships