require_relative 'entities/author' 
require_relative 'entities/book'
require_relative 'entities/reader'
require_relative 'entities/order'
require 'json'


class Library
	attr_accessor :authors, :books, :readers, :orders

	hash_from_json = {}

	def initialize(authors = [], books = [], readers = [], orders = [])
		@authors = authors,
		@books = books,
		@readers = readers,
		@orders = orders
	end

	def add_instance(instance)
		case instance
			when Author
				authors << instance
				puts "you have added an author to the library"
			when Book 
				books << instance
				puts "you have added a book to the library"
			when Reader 
				readers << instance
				puts "you have added a reader to the library"
			when Order
				orders << instance
				puts "you have added an order to the library"
		end
		# puts authors
		# authors.each do |author|
		# 	if author.class == Author
		# 		puts author.name
		# 	end
		# end
	end

	def json_to_hash
		file = File.read('library.json')
		hash_from_json = JSON.parse(file)
		hash_to_library(hash_from_json)
	end

	def hash_to_library(hash_from_json)
		puts hash_from_json
		hash_from_json.each do |item, list|
			case item
				when "authors"
					list.each do |list_item|
						add_instance(Author.new(list_item["name"]))
					end
				when "books"
					list.each do |list_item|
						authors.each do |author|
							if author.class == Author
								if author.name == list_item["author"]
									add_instance(Book.new(list_item["title"], author))
								end
							end
						end
					end
				when "readers"
					list.each do |list_item|
						add_instance(Reader.new(list_item["name"], list_item["email"], 
												list_item["city"], list_item["street"], list_item["house"]))
					end
				when "orders"
					list.each do |list_item|
						books.each do |book|
							if book.class == Book
								if book.title == list_item["book"]
									readers.each do |reader|
										if reader.name = list_item["reader"]
											add_instance(Order.new(book, reader))
										end
									end
								end
							end
						end
					end
			end
		end
	end

end