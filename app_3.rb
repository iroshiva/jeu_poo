require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'



puts "---------------------------------------------------"
puts "|     Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |"
puts "| Le but du jeu est d'être le dernier survivant ! |"
puts "---------------------------------------------------"


puts "Quel est ton super nom de combattant?"
print "> "
user_name = gets.chomp
my_game = Game.new(user_name)

while my_game.is_still_ongoing? == true

	my_game.show_player
	my_game.menu
	my_game.menu_choice
	my_game.enemies_attack
	
end

my_game.end

# binding.pry
# puts "end of file"