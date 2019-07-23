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
		"#{@name} a #{@life_points} points de vie"
	end

	def gets_damage(level_damage)
		@life_points -= level_damage

		if @life_points <= 0
			puts "#{@name} a été tué!"
			@life_points = 0
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

class HumanPlayer < Player
# la class HumanPlayer va hérité de Player, cad que chaque instance de HumanPlayer aura un nom et un life_points + les méthodes spécifiques

	attr_accessor :weapon_level

	def initialize(nom)
		@name = nom 
		@life_points = 100
		@weapon_level = 1
	end

	def show_state
	# methode spécifique 
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end

	def compute_damage
    	rand(1..6) * @weapon_level
  end

	def search_weapon
		new_weapon_level = rand(1..6)
		puts " "
		puts "Tu as trouvé une arme de niveau #{new_weapon_level}!"

		if new_weapon_level > @weapon_level
			puts "Youhou ! Elle est meilleure que ton arme actuelle : Tu la prends!"
			@weapon_level = new_weapon_level
			puts "Tu as maintenant une arme de niveau #{@weapon_level}!"
		else 
			puts "M@*#$... elle n'est pas mieux que ton arme actuelle... autant garder la même!"
		end

	end

	def search_health_pack
		health_pack_level = rand(1..6)

		case health_pack_level

		when 1
			 puts "Tu n'as rien trouvé... " 
		when 2..5
			 puts "Bravo, tu as trouvé un pack de +50 points de vie !"
			@life_points += 50
		when 6
			 puts "Waow, tu as trouvé un pack de +80 points de vie ! Tu déchires!!!"
			@life_points += 80
		end

		life_points_limit

	end

	def life_points_limit
		if @life_points > 100
			@life_points = 100
			puts "Malheureusement, ton niveau de vie ne peux pas dépasser 100! Faut pas abuser! ;)"
		end	
	end


end