require 'spec_helper'

describe Template do
  it{ should belong_to(:theme) }
  it{ should validate_presence_of(:name) }
  it{ should validate_presence_of(:body) }
end
