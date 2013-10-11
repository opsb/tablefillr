require 'spec_helper'

describe Theme do
	it{ should have_one(:restaurant_theme) }
  	it{ should have_one(:restaurant).through(:restaurant_theme) }
end
