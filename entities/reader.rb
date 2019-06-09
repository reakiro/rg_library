class Reader
  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house.to_i
  end

  def self.from_hash(value, _array_of_existing_items)
    new(value['name'], value['email'],
        value['city'], value['street'], value['house'])
  end
end
