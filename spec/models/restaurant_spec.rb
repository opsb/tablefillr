require 'spec_helper'

describe Restaurant do
	it{ should have_many(:users) }
	it{ should accept_nested_attributes_for(:users) }
	it{ should validate_presence_of(:name) }
	it{ should validate_presence_of(:address) }
	it{ should have_one(:restaurant_theme) }
	it{ should have_one(:theme).through(:restaurant_theme) }

	it "should assign standard if theme if none present" do
		restaurant = Restaurant.make! theme: nil
		restaurant.theme.should == Theme.standard
	end
end
