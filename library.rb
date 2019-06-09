require_relative 'dependencies'

class Library
  attr_reader :authors, :books, :readers, :orders

  include ReadFile
  include WriteToFile
  include Queries

  def initialize(authors = [], books = [], readers = [], orders = [])
    @authors = authors
    @books = books
    @readers = readers
    @orders = orders
  end

  def add(instance)
    case instance
    when Author then authors << instance
    when Book   then books << instance
    when Reader then readers << instance
    when Order  then orders << instance
    end
  end
end
