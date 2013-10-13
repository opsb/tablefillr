require 'machinist/active_record'

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
	object.attributes = ThemeLoader.load(Rails.root.join("fixtures", "themes", "modernizm").to_s)
end
