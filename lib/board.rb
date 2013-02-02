module Board
  @board = []
  @squares = 0
  def set_squares(n, m = 1)
  	@squares = n * m
  	@cols = m
  	@board = Array.new(@squares) { Array.new(0)}
  end

  def place(player, n = 0, m = 0) 
  	index = n * @cols + m
  	@board[index] << player
  end

  def remove(player)
    loc = location(player)
    @board[loc[0]].delete(player) unless loc.nil?
    loc
  end


  def players_at(n, m = 0) 
  	index = n * @cols + m
  	@board[index]
  end

  def location(player) 
    @board.each_index { |i| return [i / @cols, i % @cols] if @board[i].include? player }
    return []
  end

  def dim
    [@board.length / @cols, @cols]
  end

end