require 'spec_helper'

describe Theme do
	it{ should have_many(:restaurant_themes) }
  	it{ should have_many(:restaurant).through(:restaurant_themes) }
  	it{ should have_many(:pages) }
  	it{ should have_many(:layouts) }

  	it{ should validate_presence_of(:name) }

  	it "should have standard theme" do
  		Theme.standard.should_not be_nil
  	end
end
