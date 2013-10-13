namespace :themes do
	task :refresh_standard => :environment do
		Theme.standard.update_attributes ThemeLoader.load("standard")
	end
end
