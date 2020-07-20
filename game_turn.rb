require_relative 'game'


module GameTurn
    def self.take_turn(player)
      die = Die.new
      @number_rolled = die.roll
      case die.roll
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
    end
end