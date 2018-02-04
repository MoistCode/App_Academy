class BattleshipGame
  attr_reader :board, :player

  def initialize(player, board)
    @player = player
    @board = board #Instance of Board::Class
  end

  def attack(pos)
    x, y = pos
    board.grid[x][y] = :x
  end

  def count
    board.count
  end

  def game_over?
    board.won?
  end

  def play_turn
    attack(player.get_play)
  end

end
