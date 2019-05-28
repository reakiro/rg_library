class Reader

	attr_accessor :name, :email, :city, :street, :house

	def initialize(name, email, city, street, house)

		if house.to_i <= 0
			puts "house number must be more than 0"
		else
			@name = name
			@email = email
			@city = city
			@street = street
			@house = house.to_i
		end

		puts "Reader #{name} from #{city} was added to db"
	end

	def as_json(options={})
        {
            name: @name,
            email: @email,
            city: @city,
            street: @street,
            house: @house
        }
    end

    def to_json(*options)
        as_json(*options).to_json(*options)
    end
end