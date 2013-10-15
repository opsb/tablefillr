Feature: Theme design
	As a theme designer
	I want to upload themes to tablefillr
	So that they can be used for restaurant websites

	Scenario: Update an existing theme
		Given there's a theme called "Modernizm"
		And an http client uploads some pages, layouts and assets to the theme
		Then the uploaded files should have been saved with the theme
		When an http client deletes the same page, layouts and assets from the theme
		Then the theme should not include the deleted files