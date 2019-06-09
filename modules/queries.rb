module Queries
  def top_reader(top_readers_count = 1)
    readers_count = orders.each_with_object(Hash.new(0)) do |order, hash|
      hash[order.reader.name] += 1
    end

    readers_count = readers_count.sort_by do |_reader, count|
      count
    end.reverse!.to_h

    readers_count.keys.first(top_readers_count)
  end

  def most_popular_books(most_popular_books_count = 1)
    books_count = orders.each_with_object(Hash.new(0)) do |order, hash|
      hash[order.book.title] += 1
    end

    books_count = books_count.sort_by do |_book, count|
      count
    end.reverse!.to_h

    books_count.keys.first(most_popular_books_count)
  end

  def popular_books_number_of_readers(most_popular_books_count = 3)
    books_list = most_popular_books(most_popular_books_count)

    orders_of_popular_books = orders.map do |order|
      if books_list.include? order.book.title
        [order.book.title, order.reader.name]
      end
    end

    orders_of_popular_books.uniq! do |value|
      [value[1]]
    end

    orders_of_popular_books.length
  end
end
