class Die
    attr_accessor :die 
    attr_reader :number

    def initialize
        roll
        @die = die
        @number = []
    end

    def roll
        @number = rand(1..6)
    end
end