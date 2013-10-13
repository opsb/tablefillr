require 'machinist/active_record'
require Rails.root.join("lib", "themes", "theme_loader").to_s

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

Restaurant.blueprint do
	name { Faker::Company.name }
	address { Faker::Address.full }
end

Theme.blueprint(:modernizm) do
	theme = ThemeLoader.load(Rails.root.join("fixtures", "themes", "modernizm").to_s)
	object.attributes = theme.attributes
end
