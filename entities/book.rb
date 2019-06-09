class Book
  attr_reader :title, :author

  def initialize(title, author)
    if author.instance_of? Author
      @title = title
      @author = author
    else
      raise NotAnInstanceError, 'author must be an instance of Author class'
    end
  end

  def self.from_hash(values, array_of_existing_items)
    array_of_existing_items.each do |items|
      items.each do |item|
        next unless item.class == Author
        return new(values['title'], item) if values['author'] == item.name
      end
    end
  end
end
