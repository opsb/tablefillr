require 'spec_helper'

describe RestaurantTheme do
  it{ should belong_to(:restaurant) }
  it{ should belong_to(:theme) }
end
