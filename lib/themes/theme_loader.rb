module ThemeLoader
	def self.load(name)
		Theme.new name: name,
				  home_page: load_page(name, "home"),
				  menu_page: load_page(name, "menu"),
				  location_page: load_page(name, "location")
	end

	def self.load!(name)
		theme = load(name)
		theme.save!
		theme
	end

	def self.load_page(theme_name, page_name)
		page_template_path = Rails.root.join("lib", "themes", theme_name, "#{page_name}.html.liquid")
		File.read(page_template_path)
	end
end