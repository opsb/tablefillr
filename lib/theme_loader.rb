module ThemeLoader

	def self.load(location)
		theme_name, theme_path = theme_name_and_path_for(location)

		layouts_path = File.join(theme_path, "layouts")
		pages_path = File.join(theme_path, "pages")

		{
			name: theme_name, 
			layouts_attributes: load_templates(layouts_path),
			pages_attributes: load_templates(pages_path)
		}
	end

	def self.load_templates(path)
		Dir.glob("#{path}/*").each_with_index.inject({}) do |templates, (path, index)|
			templates[index.to_s] = {
				name: File.basename(path).split(".").first,
				content: File.read(path)
			}
			templates
		end
	end

	def self.theme_name_and_path_for(location)
		if location.include?("/")
			[location.split("/").last, location]
		else
			[location, Rails.root.join("lib", "themes", location).to_s]
		end
	end
end
