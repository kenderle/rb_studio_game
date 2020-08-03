require_relative 'player'

class BerserkPlayer < Player
    
    def initialize(name, health = 100)
        super(name, health)
        @w00t_count = 0
    end

    def berserk?
        @w00t_count > 5
    end

    def blam
        berserk? ? w00t : super
    end
    
end



if __FILE__ == $0
    berserker = BerserkPlayer.new("berserker", 50)
    6.times { berserker.w00t }
    2.times { berserker.blam }
    puts berserker.health
end