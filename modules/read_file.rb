module ReadFile
  def json_to_hash
    file = File.read('library.json')
    begin
      hash_from_json = JSON.parse(file)
      hash_to_library(hash_from_json)
    rescue JSON::ParserError
      puts 'not valid JSON'
    end
  end

  def hash_to_library(hash_from_json)
    types = {
      authors: Author,
      books: Book,
      readers: Reader,
      orders: Order
    }

    hash_from_json.each do |item, list|
      list.each do |list_item|
        add(types[item.to_sym].from_hash(list_item, [authors, books, readers, orders]))
      end
    end
  end
end
