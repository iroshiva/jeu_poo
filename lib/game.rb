require 'bundler'
require 'pry'
Bundler.require

require_relative './player'


class Game
	
	attr_accessor :human_player, :enemies

	def initialize(name)
		@human_player = HumanPlayer.new("#{name}")
		@enemies = [player1 = Player.new("Riri"), player2 = Player.new("Fifi"), player3 = Player.new("Loulou"), player4 = Player.new("Picsou")]
	end

	def kill_player(enemy)
		@enemies.delete(enemy)
		# @enemies.reject {|enemy| enemy.life_points < 0}
	end

	def is_still_ongoing?
		if @human_player.life_points > 0 && !@enemies.empty?
			true
		else
			false
		end
		
	end

	def show_player
		@human_player.show_state
		puts "Il reste encore #{@enemies.length} ennemies!"
	end

	def menu
		puts "Quelle action veux-tu effectuer ?\n\n"
		puts "a - chercher une meilleure arme"
		puts "s - chercher à se soigner\n\n"
		puts "Attaquer un joueur en vue:"
		@i = 0
	    @enemies.each do
	      puts "#{@i} - #{@enemies[@i].show_state}"
	     @i +=1
	     end
		
	end

	def menu_choice
		puts "Le temps presse.... Balance ton choix!"
		print "> "
		choice = gets.chomp

		case choice 
			when "a"
				@human_player.search_weapon
			when "s"
				@human_player.search_health_pack
			when "0"
				if @enemies[0].life_points > 0
					@human_player.attacks(@enemies[0])
				end
			when "1"
				if @enemies[1].life_points > 0
					@human_player.attacks(@enemies[1])
				end
			when "2"
				if @enemies[2].life_points > 0
					@human_player.attacks(@enemies[2])
				end
			when "3"
				if @enemies[3].life_points > 0
					@human_player.attacks(@enemies[3])
				end
		end

		@enemies.each do |enemy|
			if enemy.life_points <= 0
				kill_player(enemy)
			end
		end

	end

	def enemies_attack

		if is_still_ongoing?
			puts "Les autres joueurs t'attaquent!!!"
			@enemies.each do |enemy|
				if enemy.life_points > 0
					enemy.attacks(@human_player)	
				end
			end
		end
	end

	def end
		if @human_player.life_points >0
		puts"BRAVO! TU AS GAGNE!"
		
		else
			puts "Loser! Tu as perdu!"
		end
	end


end

# binding.pry
# puts "end of file"