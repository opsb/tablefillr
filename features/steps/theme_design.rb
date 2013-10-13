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
    # upload page
    @page_file_path = Rails.root.join("fixtures", "themes", "modernizm", "pages", "home.html.liquid")
    page_file = Rack::Test::UploadedFile.new(@page_file_path, "text/html")
    put theme_page_path('modernizm', 'home'), :body => page_file

    #upload layout
    @layout_file_path = Rails.root.join("fixtures", "themes", "modernizm", "layouts", "layout.html.liquid")
    layout = Rack::Test::UploadedFile.new(@layout_file_path, "text/html")
    put theme_layout_path('modernizm', 'home'), :body => layout    

    #upload assets
  end

  step 'the uploaded files should have been saved with the theme' do
    modernizm = Theme.find_by_permalink("modernizm")
    home_page = modernizm.pages.find_by_name("home")
    home_page.body.should == File.read(@page_file_path)
  end
end
