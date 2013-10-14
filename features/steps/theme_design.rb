require "rack/test"

class Spinach::Features::ThemeDesign < Spinach::FeatureSteps
  include Rack::Test::Methods

  def app
    Tablefillr::Application
  end

  step 'there\'s a theme called "Modernizm"' do
    Theme.make!(:modernizm)
  end

  step 'an http client uploads some pages and assets to the theme' do
    theme_path = Rails.root.join("fixtures", "themes", "modernizm")

    # upload page
    @page_file_path = File.join(theme_path, "pages", "home.html.liquid")
    page_file = Rack::Test::UploadedFile.new(@page_file_path, "text/html")
    put theme_page_path('modernizm', 'home'), :content => page_file
    last_response.status.should == 200

    #upload layout
    @layout_file_path = File.join(theme_path, "layouts", "main.html.liquid")
    layout = Rack::Test::UploadedFile.new(@layout_file_path, "text/html")
    put theme_layout_path('modernizm', 'home'), :content => layout    
    last_response.status.should == 200

    #upload assets
    @asset_path = File.join(theme_path, "assets", "screen.css")
    asset = Rack::Test::UploadedFile.new(@asset_path, "text/css")
    put theme_asset_path('modernizm', 'screen.css'), :content => asset
    last_response.status.should == 200
  end

  step 'the uploaded files should have been saved with the theme' do
    modernizm = Theme.find_by_permalink("modernizm")
    home_page = modernizm.pages.find_by_name("home")
    home_page.content.should == File.read(@page_file_path)
  end
end
