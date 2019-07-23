# require "pry"

class Player
# création d'une classe générale Player

	attr_accessor :name, :life_points
	# création des variables d'instance
	# chaque instance créée, donc chaque Player.new, auront les variables name et life_points

	def initialize(nom)
	# initie une méthode classe qui va assigner les variables d'instance name et life_points == 10 à chaque instance créée == chaque joueur créé == chaque objet créé

		@name = nom
		@life_points = 10
	end

	def show_state
	# methode spécifique 
		puts "#{@name} a #{life_points} points de vie"
	end

	def gets_damage(level_damage)
		@life_points -= level_damage

		if @life_points <= 0
			puts "#{@name} a été tué!"
		end
	end

	def attacks(player)
		puts "#{self.name} attaque #{player.name}"
		level_damage = compute_damage

		puts "#{self.name} inflige #{level_damage} points de dommages à #{player.name}!"

		player.gets_damage(level_damage)
	end

	def compute_damage
		return rand(1..6)
	end
	
end

# binding.pry
# puts "end of file"