class Book

	attr_accessor :title, :author

	def initialize(title, author)

		if author.instance_of? Author
			@title = title
			@author = author
		else
			puts "author must be an instance of author class"
		end

		puts "book #{title} by #{author.name} was added to db"
	end

	def as_json(options={})
        {
            title: @title,
            author: @author.name
        }
    end

    def to_json(*options)
        as_json(*options).to_json(*options)
    end
end