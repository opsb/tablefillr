require "rack/test"

class Spinach::Features::ThemeDesign < Spinach::FeatureSteps
  include Rack::Test::Methods

  def app
    Tablefillr::Application
  end

  step 'there\'s a theme called "Modernizm"' do
    @modernizm = Theme.make!(:modernizm)
  end

  step 'an http client uploads some pages, layouts and assets to the theme' do
    theme_path = Rails.root.join("fixtures", "themes", "modernizm")

    # upload page
    @page_file_path = File.join(theme_path, "pages", "home.html.liquid")
    page_file = Rack::Test::UploadedFile.new(@page_file_path, "text/html")
    put theme_page_path('modernizm', 'home'), :content => page_file
    last_response.status.should == 200

    #upload layout
    @layout_file_path = File.join(theme_path, "layouts", "main.html.liquid")
    layout = Rack::Test::UploadedFile.new(@layout_file_path, "text/html")
    put theme_layout_path('modernizm', 'main'), :content => layout    
    last_response.status.should == 200

    #upload asset
    @asset_file_path = File.join(theme_path, "assets", "screen.css")
    asset = Rack::Test::UploadedFile.new(@asset_file_path, "text/css")
    put theme_asset_path('modernizm', 'screen.css'), :content => asset
    last_response.status.should == 200
  end

  step 'the uploaded files should have been saved with the theme' do
    modernizm = Theme.find_by_permalink("modernizm")

    #page
    page = modernizm.pages.find_by_name("home")
    page.content.should == File.read(@page_file_path)

    #layout
    layout = modernizm.layouts.find_by_name("main")
    layout.content.should == File.read(@layout_file_path)

    #asset
    asset = modernizm.assets.find_by_path("screen.css")
    asset.content.url.should_not be_nil
  end

  step 'an http client deletes the same page, layouts and assets from the theme' do
    delete theme_page_path('modernizm', 'home')
    last_response.status.should == 200

    delete theme_layout_path('modernizm', 'main')
    last_response.status.should == 200

    delete theme_asset_path('modernizm', 'screen.css')
    last_response.status.should == 200
  end

  step 'the theme should not include the deleted files' do
    @modernizm.pages.find_by_name("home").should be_nil
    @modernizm.layouts.find_by_name("main").should be_nil
    @modernizm.assets.find_by_path("screen.css").should be_nil
  end
end
