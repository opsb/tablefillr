require 'spec_helper'

describe Theme do
	it{ should have_many(:restaurant_themes) }
  	it{ should have_many(:restaurant).through(:restaurant_themes) }
  	it{ should have_many(:pages) }

  	it{ should validate_presence_of(:name) }
end
