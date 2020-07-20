require_relative 'player'
require_relative 'die'

class Game
    attr_accessor :title

    def initialize(title)
        @title = title.capitalize
        @players = []
    end

    def add_player(a_player)
        @players.push(a_player)
    end

    def play
        
        puts "There are #{@players.size} players in #{@title}: \n"
        @players.each do |player|
            puts player.to_s
        end

        @players.each do |player|
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
            puts player
          end
    end


end

if __FILE__ == $0
    example_game = Game.new("Example Game")
    example_game.add_player('aaron')
    example_game.add_player('barry')
    example_game.add_player('clark')
    example_game.add_player('david')
    example_game.play
end