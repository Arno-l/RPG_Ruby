
#Cette classe permet d'implémenter des joueurs et de les faire combattre

class Player
  attr_accessor :name, :life_points
  @@players_array = []
  #Initialisation
  def initialize(name_p)
    @name = name_p
    @life_points = 10
    @@players_array << self
    end
# Montre le niveau de vie restant
  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end
#Perte de points (dommages)
  def gets_damage(damage)
     @life_points -= damage
   if @life_points <= 0
    puts "Le joueur #{@name} a été tué !"
   end
   return @life_points
end
#Attaque d'un joueur sur un autre joueur
def attacks(name_p)
     puts "Le joueur #{@name} attaque le joueur #{name_p.name}!"
    attack = compute_damage
    
    if attack == 5 || attack == 6
    puts "Il a les nerfs et lui inflige #{attack} points de dommage "
    else
    puts "Il lui inflige #{attack} points de dommage"
    end
    name_p.gets_damage(attack)
end

# Retourne un nombre au hasard entre 1 et 6
def compute_damage
    return rand(1..6)
end

end

class HumanPlayer < Player
attr_accessor :weapon_level

def initialize(name)
 @name = name
 @life_points = 100
 @weapon_level = 1
end

def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
end

def compute_damage
    rand(1..6) * @weapon_level
end

def search_weapon 
  search_w =  rand(1..6)
  puts "Tu as trouvé une arme de niveau #{search_w}"
  if search_w > @weapon_level
     @weapon_level = search_w
     puts "Super! Ça va faire mal"
  else
    puts "Inutile d'échanger ton arme avec celle la "
  end
end

def search_health_pack
  search_hp =  rand(1..6)
    if search_hp == 1
        puts "Tu n'as rien trouver"
    elsif search_hp >= 2 && search_hp <= 5
        while @life_points <= 100
            @life_points += 50
            break if @life_points == 100
        end
        puts "Tu as trouvé un pack de 50 points de vie"
    elsif search_hp == 6
        while @life_points <= 100
            @life_points += 80
            break if @life_points == 100
        end
        puts "Tu as trouvé un pack de 80 points de vie"
    end
end






end











