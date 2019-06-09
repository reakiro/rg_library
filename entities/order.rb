class Order
  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Date.today)
    if (book.instance_of? Book) && (reader.instance_of? Reader) && (date.instance_of? Date)
      @book = book
      @reader = reader
      @date = date
    else
      raise NotAnInstanceError, 'book, reader and date must be instances of Book,
                                 Reader and Date classes accordingly'
    end
  end

  def self.from_hash(values, array_of_existing_items)
    book = ''
    reader = ''

    array_of_existing_items.each do |items|
      items.each do |item|
        next unless item.class == Book

        book = item if values['book'] == item.title
      end

      items.each do |item|
        next unless item.class == Reader

        reader = item if values['reader'] == item.name
      end
    end

    new(book, reader)
  end
end
