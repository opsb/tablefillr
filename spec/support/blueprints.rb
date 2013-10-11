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
