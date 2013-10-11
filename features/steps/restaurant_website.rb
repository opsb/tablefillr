class Spinach::Features::RestaurantWebsite < Spinach::FeatureSteps
  step 'the restaurant "The Golden Dragon" has created a website' do
    @restaurant = Restaurant.make! name: "The Golden Dragon"
  end

  step 'their website should be available at their subdomain' do
  	visit root_url(:subdomain => @restaurant.subdomain)
  end

  step 'it should include a home page, food page and location page' do
    %w{home food location}.each do |page_name|
      visit restaurant_pages_url(:page => page_name, :subdomain => @restaurant.subdomain)
    end
  end  
end
