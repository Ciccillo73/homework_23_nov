require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO films
    (
    title,
    price
    )
    VALUES
    (
    $1, $2
    )
    RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = title['id'].to_i

  end

  def customers()
    sql = "SELECT customers.*
    FROM customers
    INNER JOIN tickets
    ON tickets.customer_id = customers.id
    WHERE customer_id = $1"
    values = [@id]
    customer_data = SqlRunner.run(sql, values)
    return Customer.map_items(customer_data)
  end

  def self.all()
    sql = "SELECT * FROM films"
    film_data = SqlRunner.run(sql)
    return Location.map_items(film_data)
  end



  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.map_items(film_data)
    result = film_data.map { |film| Location.new( film ) }
    return result

  end

end
