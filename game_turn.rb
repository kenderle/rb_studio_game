
require_relative 'die'
require_relative 'player'
require_relative 'treasure_trove'

module GameTurn
    def self.take_turn(player)
      die = Die.new
      @number_rolled = die.roll
      case @number_rolled
      when 1..2
        puts "#{player.name} rolled a #{@number_rolled}."
        player.blam
      when 3..4
        puts "#{player.name} rolled a #{@number_rolled}."
        puts "#{player.name} was skipped this turn."
      else
        puts "#{player.name} rolled a #{@number_rolled}."
        player.w00t
      end   

    treasure = TreasureTrove.random
    player.found_treasure(treasure)
    
    end

end