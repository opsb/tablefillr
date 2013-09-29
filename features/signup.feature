Feature: Signup
	As a restaurant owner
	I want a website
	So that I can increase my number of customers

	Scenario: Signup
		Given I hit the call to action on the home page
		And I register with the name of my restaurant, address, first name, last name, email, password
		Then my user account should have been created
		And I should see my Dashboard