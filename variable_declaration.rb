require_relative 'library'

def get_library
  library = Library.new

  library.add(author1 = Author.new('darina'))
  library.add(book1 = Book.new('title', author1))
  library.add(reader1 = Reader.new('name1', 'email1', 'city1', 'street1', 1))
  library.add(order1 = Order.new(book1, reader1))
  library.add(reader2 = Reader.new('name2', 'email1', 'city1', 'street1', 1))
  library.add(order2 = Order.new(book1, reader2))
  library.add(author2 = Author.new('dariiiina'))
  library.add(author3 = Author.new('sasha'))
  library.add(author4 = Author.new('ssssss'))
  library.add(book2 = Book.new('title333', author4))
  library.add(reader3 = Reader.new('name3', 'email1', 'city1', 'street1', 1))
  library.add(order3 = Order.new(book2, reader2))
  library.add(order4 = Order.new(book2, reader3))

  library
end
