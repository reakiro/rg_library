require_relative 'variable_declaration'

library = get_library

library.json_to_hash

library.data_to_json

puts 'top reader', library.top_reader
puts 'most popular books', library.most_popular_books
puts 'number of unique readers of most popular books', library.popular_books_number_of_readers
