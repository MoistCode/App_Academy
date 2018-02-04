class HumanPlayer

  def initialize(player)

  end

  def get_play
    puts "Please enter your move in the form of [x, y]"
    user_input = gets.chomp.gsub(/\D/, "")
    user_input.split("").map {|el| el.to_i}
  end

end
