module ThemeLoader
	def self.load!(name)
		theme = load(name)
		theme.save!
		theme
	end

	def self.load(name)
		Theme.new name: name,
				  home_page: load_template(name, "templates/home"),
				  food_page: load_template(name, "templates/food"),
				  location_page: load_template(name, "templates/location"),
				  layout: load_template(name, "templates/layout")
	end

	def self.load_template(theme_name, template_name)
		template_path = Rails.root.join("lib", "themes", theme_name, "#{template_name}.html.liquid")
		File.read(template_path)
	end
end
