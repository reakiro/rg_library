class Author

	attr_accessor :name, :biography

	def initialize(name, *biography)
		@name = name
		@biography = biography

		puts "Author #{name} was added to db"
	end

	def as_json(options={})
        {
            name: @name,
            biography: @biography
        }
    end

    def to_json(*options)
        as_json(*options).to_json(*options)
    end
end