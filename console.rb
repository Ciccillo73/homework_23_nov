# require_relative('..models/customer')
require_relative( 'models/film' )
# require_relative('..models/ticket')

require( 'pry-byebug' )

Film.delete_all()

film1 = Film.new({ 'title' => 'Scarface', 'price' => 5.00})
film1.save()

binding.pry
nil
