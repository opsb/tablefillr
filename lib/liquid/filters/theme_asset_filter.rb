module Liquid
	module Filters
		module ThemeAssetFilter
			def theme_asset_url(path)
				@context.environments.first['theme'].assets.find_by_path(path).content.url
			end
		end
	end
end

Liquid::Template.register_filter(Liquid::Filters::ThemeAssetFilter)