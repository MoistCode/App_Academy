class HumanPlayer

  attr_accessor :name, :board

  def initialize(name)
    @name = name
    @mark
  end

  def display(board_input)
    puts board_input.grid
  end

  def get_move
    prompts_user
  end

  def prompts_user
    puts "Where would you like to place your mark."
    gets.chomp.gsub(/[^0-9]/, "").split("").map{|el| el.to_i}
  end

end
