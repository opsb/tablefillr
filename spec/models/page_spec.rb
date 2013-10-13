require 'spec_helper'

describe Page do
  it{ should belong_to(:theme) }

  it{ should validate_presence_of(:name) }
  it{ should validate_presence_of(:body) }
end
