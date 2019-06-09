module WriteToFile
  def data_to_json
    hash_to_json = {
      authors: [],
      books: [],
      readers: [],
      orders: []
    }

    hash_to_json[:authors] = authors_to_hash
    hash_to_json[:books] = books_to_hash
    hash_to_json[:readers] = readers_to_hash
    hash_to_json[:orders] = orders_to_hash

    hash_to_json.to_json

    File.open('library.json', 'w') do |file|
      file.write(JSON.pretty_generate(hash_to_json))
    end
  end

  def authors_to_hash
    authors.map do |author|
      {
        name: author.name,
        biography: author.biography
      }
    end
  end

  def books_to_hash
    books.map do |book|
      {
        title: book.title,
        author: book.author.name
      }
    end
  end

  def readers_to_hash
    readers.map do |reader|
      {
        name: reader.name,
        email: reader.email,
        city: reader.city,
        street: reader.street,
        house: reader.house
      }
    end
  end

  def orders_to_hash
    orders.map do |order|
      {
        book: order.book.title,
        reader: order.reader.name,
        date: order.date
      }
    end
  end
end
