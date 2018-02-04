class Code
  attr_reader :pegs
  PEGS = {
    'R'=> :red,
    'G'=> :green,
    'B'=> :blue,
    'Y'=> :yellow,
    'O'=> :orange,
    'P'=> :purple
  }

  def initialize(pegs)
    @pegs = pegs
  end

  def self.parse(string)
    if valid_color(string)
      pegs = string.upcase.each_char.map do |ltr|
        PEGS[ltr]
      end
      Code.new(pegs)
    end
  end

  def self.valid_color(string)
    string.upcase.each_char do |ltr|
      raise "Invalid Color" if PEGS.keys.none? {|k| k == ltr}
    end
    true
  end

  def self.random
    Code.new(PEGS.keys.shuffle[0..3].join)
  end

  def [](input)
    pegs[input  ]
  end

  def exact_matches(other_code)
    num_of_exact = 0
    self.pegs.each_with_index do |el, idx|
      other_code.pegs.each_with_index do |el2, idx2|
        num_of_exact += 1 if (el == el2 && idx == idx2)
      end
    end
    num_of_exact
  end

  def near_matches(other_code)
    used = []
    num_of_near = 0
    self.pegs.each_with_index do |el, idx|
      other_code.pegs.each_with_index do |el2, idx2|
        if el == el2 && idx != idx2 && used.none?{|ltr| ltr==el}
          used << el
        end
      end
    end

    exact = []
    self.pegs.each_with_index do |el, idx|
      other_code.pegs.each_with_index do |el2, idx2|
        exact << el if (el == el2 && idx == idx2)
      end
    end

    (used - exact).length
  end

  def ==(other_code)
    return false if self.class != Code || other_code.class != Code
    self.pegs == other_code.pegs
  end

end

class Game
  attr_accessor :guess_counter
  attr_reader :secret_code

  def initialize(secret_code = Code.random)
    @secret_code = secret_code
  end

  def start
    @guess_counter = 0
    winner = nil
    while winner == nil && guess_counter < 10
      @guess_counter += 1
      winner = get_guess
    end
    puts "You're good at this!" if winner == true
    puts "You're really bad at this" if winner.nil?
  end

  def get_guess
    puts "Please type your guess"
    user_guess = Code.parse(gets.chomp)
  end

  def display_matches(other_code)
    code1 = Code.new(Code.parse(secret_code.pegs).pegs)
    code2 = Code.new(other_code.pegs)
    puts "Current Guess: #{guess_counter}"
    puts "Number of exact matches: #{code1.exact_matches(code2)}"
    puts "Number of near matches: #{code1.near_matches(code2)}"
    return true if code1.exact_matches(code2) == 4
  end

end
