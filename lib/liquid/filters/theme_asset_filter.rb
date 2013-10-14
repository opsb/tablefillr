module Liquid
	module Filters
		module ThemeAssetFilter
			def theme_asset_url(name)
				@context.environments.first['theme'].assets.find_by_name(name).content.url
			end
		end
	end
end

Liquid::Template.register_filter(Liquid::Filters::ThemeAssetFilter)