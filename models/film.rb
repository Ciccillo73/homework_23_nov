require_relative("../db/sql_runner")
class Film
  attr_reader :id
  attr_accessor :title, :price
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['name']
    @price = options['price']
  end

  

end
