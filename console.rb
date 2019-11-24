require_relative('models/customer')
require_relative( 'models/film' )
require_relative('models/ticket')

require( 'pry-byebug' )

Film.delete_all()
Customer.delete_all()
Ticket.delete_all()

film1 = Film.new({ 'title' => 'Scarface', 'price' => 5.00})
film1.save()
film2 = Film.new({ 'title' => 'Frozen', 'price' => 7.00})
film2.save()
film3 = Film.new({ 'title' => 'Joker', 'price' => 6.00})
film3.save()

customer1 = Customer.new({'name' => 'John', 'funds' => 25.00})
customer1.save()
customer2 = Customer.new({'name' => 'Bill', 'funds' => 30.00})
customer2.save()

ticket1 = Ticket.new({'customer_id' => customer1.id , 'film_id' => film1.id, 'review' => '5 stars, would visit again if I could' })
ticket2 = Ticket.new({'customer_id' => customer2.id , 'film_id' => film3.id, 'review' => '4 stars, maybe visit again if I could' })

binding.pry
nil
