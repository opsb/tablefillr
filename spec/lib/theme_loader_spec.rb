require 'spec_helper'

describe ThemeLoader do
	describe "load theme from a directory" do
		let(:loaded_theme){ Theme.create( ThemeLoader.load("standard") ) }

		it "should have a name" do
			loaded_theme.name.should == "standard"
		end

		it "should have pages" do
			loaded_theme.pages.map(&:name).sort.should == %w{food home location}
		end

		it "should have layouts" do
			loaded_theme.layouts.map(&:name).sort.should == %w{main}
		end
	end
end
