require 'spec_helper'

describe Asset do
  it{ should belong_to(:theme) }
  it{ should validate_presence_of(:content) }
end
