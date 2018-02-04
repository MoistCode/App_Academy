class ComputerPlayer

  attr_accessor :name, :board, :mark

  def initialize(name)
    @name = name
    @mark
  end

  def display(board_input)
    @board = board_input
  end

  def get_move
    winning_moves
  end

  def possible_moves
    arr = []
    board.grid.each_with_index do |el, idx|
      el.each_index.select{|idx| el[idx].nil?}.each do |el2|
        arr << [idx, el2]
      end
    end
    arr
  end

  def winning_moves
    working_board = Board.new
    possible_moves.each do |el|
      working_board.grid = Marshal.load(Marshal.dump(board.grid))
      working_board.place_mark(el, mark)
      return el if !working_board.winner.nil?
    end
    random_move
  end

  def random_move
    possible_moves.shuffle[0]
  end

end
