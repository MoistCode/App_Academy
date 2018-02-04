require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game

  attr_accessor :player_one, :player_two, :board, :current

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @board = Board.new
    @current = player_one
  end

  def current_player
    current
  end

  def switch_players!
    current_player == player_one ? @current = player_two : @current = player_one
  end

  def play_turn
    board.place_mark(current_player.get_move, current_player.mark)
    switch_players!
  end

end
