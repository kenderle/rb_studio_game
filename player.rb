require_relative 'treasure_trove'

class Player
    attr_accessor :name, :health, :score
    
    def initialize(name, health=rand(80..100))
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
    end

    def self.from_csv(string)
        name, health = string.split(',')
        Player.new(name, health.to_i)
    end
    
    def found_treasure(treasure)
        @found_treasures[treasure.name] += treasure.points
        puts "\n#{@name} found a #{treasure.name} worth #{treasure.points} points.\n"
        puts "#{@name}'s Treasures: #{@found_treasures}\n\n"
    end

    def points
        @found_treasures.values.reduce(0, :+)
    end

    def each_found_treasure
        @found_treasures.each do |name, points|
            yield Treasure.new(name, points)
        end
    end

    def w00t
        random_w00t = rand(1..15)
        @health += random_w00t
        puts "#{@name} got w00ted for #{random_w00t}!"
    end

    def blam
        random_blam = rand(10)
        @health -= random_blam
        puts "#{@name} got blammed for #{random_blam}!"
    end

    def score
        @health + points
    end

    def <=>(other)
        other.score <=> score
    end

    def to_s
        "I'm #{@name} with a health of #{@health}, points totaling #{points} and a score of #{score}."
    end

    def strong?
        @health > 100
    end

end

if __FILE__ == $0
    player = Player.new('moe')
    puts player.name
    puts player.health
    player.w00t
    puts player.health
    player.blam
    puts player.health
    puts player
end