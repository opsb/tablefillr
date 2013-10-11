require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
	chrome_user_agent = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.60 Safari/537.17"
	driver = Capybara::Poltergeist::Driver.new(app, 
		:window_size => [1200,1000], 
		:timeout => 120,
		:inspector => 'chrome.sh', 
		:js_errors => true, 
		:port => 64277,
		:cookies => true
		)
	driver.headers = { "User-Agent" => chrome_user_agent }
	driver
end

Capybara.server_port = 3030
Capybara.default_host = 'tablefillr.test'
Capybara.app_host = 'http://www.tablefillr.test'