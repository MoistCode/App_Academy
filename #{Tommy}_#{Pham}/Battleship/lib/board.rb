class Board

  attr_reader :grid

  def initialize(grid = Board.default_grid)
    @grid = grid
  end

  def self.default_grid
    Array.new(10){Array.new(10)}
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def count
    counter = 0
    grid.each do |el|
      el.each do |el2|
        counter += 1 if el2.equal?(:s)
      end
    end
    counter
  end

  def won?
    count.zero?
  end

  def empty?(pos = false)
    return false if count > 0 && pos == false
    return true if count == 0 && pos == false
    grid[pos.first][pos.last].nil?
  end

  def full?
    counter = 0
    grid.each do |el|
      el.each do |el2|
        counter += 1 if el2 == :s
      end
    end
    counter == grid.flatten.length ? true : false
  end

  def place_random_ship
    if full?
      raise "Board is full."
    else
      random_x = rand(grid.length)
      random_y = rand(grid.length)
      while !empty?([random_x, random_y])
        random_x = rand(grid.length)
        random_y = rand(grid.length)
      end
      grid[random_x][random_y] = :s
    end
  end
end
