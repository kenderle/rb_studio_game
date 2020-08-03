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

    def load_players(file_name)
        File.readlines(file_name).each do |line|
            name, health = line.split(',')
            player = Player.new(name, health.to_i)
            add_player(player)
        end
    end

    def play(rounds)


        puts "There are #{@players.size} players in #{@title}: \n"
        @players.each do |player|
            puts player.to_s
        end

        treasures = TreasureTrove::TREASURES 
        puts "\nThere are #{treasures.size} treasures to be found:\n"
        treasures.each { |treasure| puts "A #{treasure.name} is worth #{treasure.points} points."}

        1.upto(rounds) do |round|
            puts "\nRound #{round}:" 
            @players.each do |player|
                puts "#{player.name}'s turn: Round #{round}:"
                GameTurn.take_turn(player)
                puts player
            end
        end
    end
    
    def total_points
        @players.reduce(0) { |sum, player| sum + player.points }
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

        puts "\nThere were #{total_points} treasure points collected during the game."
        @players.sort.each do |player|
            puts "\n#{player.name}'s individual point totals:"
            player.each_found_treasure do |treasure|
                puts "#{treasure.points} total #{treasure.name} points."
            end
            puts "\n#{player.name}'s Treasure Point Totals:"
            puts "#{player.points} grand total points!"
        end

        def high_score_listing(player)
            formatted_name = player.name.ljust(20, '.')
            "#{formatted_name} @{player.score}"
        end

        puts "\n#{@title} High Scores:\n"
        @players.sort.each do |player|
            puts high_score_listing(player)
        end
    end

    def save_high_scores(to_file="high_scores.txt")
        File.open(to_file, "w") do |file|
          file.puts "#{@title} High Scores:"
          @players.sort.each do |player|
            file.puts high_score_listing(player)
        end
    end

    end
end

