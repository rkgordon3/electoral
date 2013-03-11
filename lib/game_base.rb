module GameBase
  class Game
    include Board
    attr_accessor :players

    def initialize(name)
      @players = []
      @current_turn = 0
      # TODO
      set_squares(100)

    end

    def add_player(player) 
      @players << player
      place(player)
    end

    def in_turn?(player)
      @players[@current_turn] == player
    end

    def player(index) 
      @players[index]
    end

    def player_in_turn
      @players[@current_turn]
    end

    def next_turn
      return if @players.length == 0
      @current_turn = (@current_turn + 1) % @players.length
    end

    def move(player, squares) 
      loc = remove(player)
      begin
        square = squares + loc[0]
        place(player, square)
      end unless loc.nil?

    end
  end

end
