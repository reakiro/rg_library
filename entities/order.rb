class Order

	attr_accessor :book, :reader, :date

	def initialize(book, reader, date=Date.today)

        if (book.instance_of? Book) && (reader.instance_of? Reader) && (date.instance_of? Date)
    		@book = book
    		@reader = reader
    		@date = date
        else 
            puts "book, reader and date must be instances of Book, Reader and Date classes accordingly"
        end

		puts "order was made from reader #{reader.name} for book #{book.title} on #{date}"
	end

	def as_json(options={})
        {
            book: @book.title,
            reader: @reader.name,
            date: @date
        }
    end

    def to_json(*options)
        as_json(*options).to_json(*options)
    end
end