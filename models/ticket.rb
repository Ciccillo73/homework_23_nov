require_relative("../db/sql_runner")
require_relative("customer")
require_relative("film")

class Ticket
  attr_reader :id
  attr_accessor :customer_id, :film_id, :review

  def initialize(options)
    @id = options ['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
    @review = options['review']
  end

  def save()
    sql = "INSERT INTO tickets
    (
      customer_id,
      film_id,
      review
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@customer_id, @film_id, @review]
    ticket = SqlRunner.run( sql,values ).first
    @id = ticket['id'].to_i
  end

  def film()
    sql = "SELECT *
    FROM films
    WHERE id = $1"
    values = [@film_id]
    film = SqlRunner.run(sql, values).first
    return User.new(film)
  end

  def customer()
    sql = "SELECT *
    FROM locations
    WHERE id = $1"
    values = [@customer_id]
    customer = SqlRunner.run(sql, values).first
    return Location.new(location)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    ticket_data = SqlRunner.run(sql)
    return Visit.map_items(ticket_data)
  end

  def self.delete_all()
   sql = "DELETE FROM tickets"
   SqlRunner.run(sql)
  end

  def self.map_items(ticket_data)
    result = ticket_data.map { |ticket| Ticket.new( ticket ) }
    return result
  end

end
