class Board

  attr_accessor :grid, :place_mark, :winner

  def initialize(grid = Array.new(3){Array.new(3)})
    @grid = grid
  end

  def self.grid
    grid
  end

  def place_mark(pos, mark)
    grid[pos.first][pos.last] = mark
  end

  def empty?(pos)
    grid[pos.first][pos.last].nil?
  end

  def winner
    return check_rows if check_rows
    return check_columns if check_columns
    return check_diagonals if check_diagonals
  end

  def get_mark_positions
    hsh = Hash.new([])
    grid.each_with_index do |el, idx|
      el.each_with_index do |el2, idx2|
        if !(el2.nil?)
          hsh[el2] = [[idx, idx2]] if !(hsh.keys.include?(el2))
          hsh[el2] << [idx, idx2] if hsh.keys.include?(el2)
          hsh[el2].uniq!
        end
      end
    end
    hsh
  end

  def check_rows
    hsh = get_mark_positions
    hsh.keys.each do |el|
      arr = []
      hsh[el].each {|el2| arr << el2.first}
      return el if arr.length == 3 && arr.uniq.length == 1
    end
    false
  end

  def check_columns
    hsh = get_mark_positions
    hsh.keys.each do |el|
      arr = []
      hsh[el].each {|el2| arr << el2.last}
      return el if arr.length == 3 && arr.uniq.length == 1
    end
    false
  end

  def check_diagonals
    diag_arr = [[0,2], [1,1], [2,0]]
    hsh = get_mark_positions
    hsh.keys.each do |el|
      arr_one = []
      arr_two = []
      hsh[el].each do |el2|
        if (diag_arr - el2).length == 0
          return el
        end
        arr_one << el2.first
        arr_two << el2.last
      end
      if arr_one.length == 3 &&
          arr_one.uniq.length == 3 &&
          arr_two.length == 3 &&
          arr_two.uniq.length == 3
        return el
      end
    end

    false
  end

  def over?
    return true if winner.nil? && !grid.any?{|el| el.include?(nil)}
    return false if winner.nil?
    true
  end

end
