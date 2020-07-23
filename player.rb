class Player
    attr_accessor :name, :health, :score
    
    def initialize(name, health=rand(80..100))
    @name = name.capitalize
    @health = health
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
        @health + @name.length
    end

    def to_s
        "I'm #{@name} with a health of #{@health} and a score of #{score}."
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