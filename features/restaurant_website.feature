Feature: Restaurant website
	As a restaurant owner
	I want a website that includes basic information about my restaurant
	So that they can find out about opening times, food and location

	Scenario: Browse all pages
		Given the restaurant "The Golden Dragon" has created a website
		Then their website should be available at their subdomain
		And it should include a home page, food page and location page