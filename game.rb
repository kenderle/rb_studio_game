require_relative 'player'

class Game
    attr_reader :title

    def initialize(title)
    @title = title.capitalize
    @players = []
    end

    def add_player(new_player)
        @players.push(new_player)
    end

    def play
        puts "There are #{@players.size} players in #{@title}: \n"
        @players.each do |player|
            puts player.to_s
        end

        @players.each do |player|
            player.blam
            player.w00t
            player.w00t
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