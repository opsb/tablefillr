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