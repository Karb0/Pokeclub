require 'httparty'
class Pokemon

  def initialize(name, att, defense, pv)
    @name = name
    @attaque = att
    @defense = defense
    @pv = pv
  end

  def name
    @name
  end

  def att
    @attaque
  end

  def defense
    @defense
  end

  def changepv(degats)
    @pv -= degats
    if @pv < 0
      @pv = 0
    end
  end

  def pv
    @pv
  end

  def fight(pokemon)
    degats = self.att - pokemon.defense
    if degats < 1
      degats = 1
    end
    pokemon.changepv(degats)
    puts "#{self.name} attaque #{pokemon.name}, il lui inflige #{degats} points de dégats, #{pokemon.name} n'a plus que #{pokemon.pv} PV"
  end

  def baston(pokemon)
    if self.pv == 0 
      puts "#{self.name} est K.O le combat est terminé #{pokemon.name} remporte ce combat"
      pokemon
    elsif pokemon.pv == 0
      puts "#{pokemon.name} est K.O le combat est terminé #{self.name} remporte ce combat"
      self
    else
      self.fight(pokemon)
      pokemon.baston(self)
    end
  end
end

class Tournament
  def initialize(nombres)
    @nombres = nombres
  end

  def displaytab
    tirage
  end

  private

  def tirage
    tabltour = []
    @nombres.times do |i|
      nb = rand(718) + 1
      pokemon = HTTParty.get("http://pokeapi.co/api/v1/pokemon/" + nb.to_s)
      tabltour << Pokemon.new(pokemon["name"], pokemon["attack"], pokemon["defense"], pokemon["hp"])
    end
    tabltour
  end

end