require 'spec_helper'

describe User do
	it{ should belong_to(:restaurant) }  
end
