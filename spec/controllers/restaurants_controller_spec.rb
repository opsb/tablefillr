require 'spec_helper'

describe RestaurantsController do
	describe "create" do
		before do
			post :create, 
				:restaurant => {
					name: "Imperial City",
					address: "Change Alley, London, Greater London, EC3V 3LL",
					theme_id: Theme.standard.id,
					:users_attributes => {
						"0" => {
							first_name: "John",
							last_name: "Woo",
							email: "woo@example.com",
							password: "password"
						}
					}
				}
		end

		it "should create a new restaurant" do
			Restaurant.first.name.should == "Imperial City"
		end

		it "should register a new user with the restaurant" do
			Restaurant.first.users.first.first_name.should == "John"
		end
	end
end
