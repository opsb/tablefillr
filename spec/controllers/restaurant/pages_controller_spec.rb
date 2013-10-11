require 'spec_helper'

describe Restaurant::PagesController do
	describe "show home page" do
		let!(:restaurant){ Restaurant.make! name: "Green bamboo" }

		before do
			request.host = "#{restaurant.subdomain}.example.com"
			get :show, :page => "home"
		end

		it "should include layout", :focus => true do
			response.body.should include("<head>")
		end
	end
end
