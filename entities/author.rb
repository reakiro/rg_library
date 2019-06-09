class Author
  attr_reader :name, :biography

  def initialize(name, *biography)
    @name = name
    @biography = biography
  end

  def self.from_hash(values, _array_of_existing_items)
    new(values['name'])
  end
end
