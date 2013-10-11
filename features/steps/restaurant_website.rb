class Spinach::Features::RestaurantWebsite < Spinach::FeatureSteps
  step 'the restaurant "The Golden Dragon" has created a website' do
    @restaurant = Restaurant.make! name: "The Golden Dragon"
  end

  step 'their website should be available at their subdomain' do
  	visit root_url(:subdomain => @restaurant.subdomain)
  end

  step 'it should include a home page, menu page and location page' do
  	visit restaurant_home_url(:subdomain => @restaurant.subdomain)
  	page.status_code.should == 200

  	visit restaurant_menu_url(:subdomain => @restaurant.subdomain)
  	page.status_code.should == 200

  	visit restaurant_location_url(:subdomain => @restaurant.subdomain)
	page.status_code.should == 200
  end  
end
