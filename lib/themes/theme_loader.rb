module ThemeLoader
	def self.load!(location)
		theme = load(location)
		theme.save!
		theme
	end

	def self.load(location)
		theme_name, theme_path = theme_name_and_path_for(location)
		layout_path = File.join(theme_path, "layouts/layout.html.liquid")
		pages_path = File.join(theme_path, "pages")

		Theme.new( name: theme_name, layout: File.read(layout_path) ) do |theme|
			Dir.glob("#{pages_path}/*") do |file_path|
				name = File.basename(file_path).split(".").first
				theme.pages.build name: name, body: File.read(file_path)
			end
		end
	end

	def self.theme_name_and_path_for(location)
		if location.include?("/")
			[
				location.split("/").last, 
				location
			]
		else
			[
				location,
				Rails.root.join("lib", "themes", location).to_s
			]
		end
	end

	def self.load_template(theme_path, template_name)
		template_path = File.join(theme_path, "#{template_name}.html.liquid")
		File.read(template_path)
	end
end
