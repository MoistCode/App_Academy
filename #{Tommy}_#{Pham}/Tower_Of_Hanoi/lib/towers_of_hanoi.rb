class TowersOfHanoi
  attr_accessor :towers

  def initialize(towers = [[3,2,1],[],[]])
    @towers = towers
    @original = towers[0].dup
  end

  def move(start_idx, end_idx)
    if valid_move?(start_idx, end_idx)
      to_tower(end_idx).push(from_tower(start_idx))
    end
  end

  def from_tower(start_idx)
    towers[start_idx].pop
  end

  def to_tower(end_idx)
    towers[end_idx]
  end

  def valid_move?(start_idx, end_idx)
    if towers[start_idx].empty?
      return false
    end

    if towers[end_idx].empty?
      return true
    end

    towers[end_idx][-1].to_i > towers[start_idx][-1].to_i
  end

  def won?
    if towers[1] == @original|| towers[2] == @original
      return true
    end
    
    false
  end

end
