require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
    attr_accessor :title

    def initialize(title)
        @title = title.capitalize
        @players = []
    end

    def add_player(a_player)
        @players.push(a_player)
    end

    def play(rounds)
        
        puts "There are #{@players.size} players in #{@title}: \n"
        @players.each do |player|
            puts player.to_s
        end

        treasures = TreasureTrove::TREASURES 
        puts "\nThere are #{treasures.size} treasures to be found:\n"
        treasures.each { |x| puts "A #{x.name} is worth #{x.points} points."}

        1.upto(rounds) do |round|
            puts "\nRound #{round}:" 
            @players.each do |player|
                puts "#{player.name}'s turn in round #{round}:"
                GameTurn.take_turn(player)
                puts player
            end
        end
    end
    
    def print_name_and_health(player)
        puts "#{player.name} #{player.health}"
    end

    def print_stats
        strong_players, wimpy_players = @players.partition { |player| player.strong? }

        puts "\n#{@title} Statistics:\n"
        puts "There are #{strong_players.size} strong players:\n"
        strong_players.each do |player|
            print_name_and_health(player)
        end

        puts "There are #{wimpy_players.size} wimpy players:\n"
        wimpy_players.each do |player|
            print_name_and_health(player)
        end

        puts "\n#{@title} High Scores:\n"
        @players.sort.each do |player|
            formatted_name = player.name.ljust(20, '.')
            puts "#{formatted_name} #{player.score}"
        end
    end

end

