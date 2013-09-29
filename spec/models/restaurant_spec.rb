require 'spec_helper'

describe Restaurant do
  it{ should have_many(:users) }
  it{ should accept_nested_attributes_for(:users) }
  it{ should validate_presence_of(:name) }
  it{ should validate_presence_of(:address) }
end
