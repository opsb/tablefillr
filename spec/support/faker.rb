module Faker
	class Address < Base

		class << self
			def full
				[
					street_address,
					secondary_address,
					city,
					zip_code
				].join(", ")
			end
		end

	end
end