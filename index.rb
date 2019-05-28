require 'date'
require 'json'

require_relative 'library'


# define_method(:convert) do |object| 
# 	my_library[object] = object.to_json


# File.open("library.json", "a") { |file| file.write(JSON.pretty_generate(my_library))}


l = Library.new()

# l.add_instance(a = Author.new("darina", "darina"))
# l.add_instance(b = Book.new("title", a))
# l.add_instance(r = Reader.new("name1", "email1", "city1", "street1", 1))
# l.add_instance(o = Order.new(b, r))

l.json_to_hash
