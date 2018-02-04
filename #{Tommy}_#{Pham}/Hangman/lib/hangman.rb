class Hangman
  attr_reader :guesser,
              :referee,
              :board

  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
  end

  def setup
    secret_length = @referee.pick_secret_word
    p secret_length
    @guesser.register_secret_length(secret_length)
    @board = Array.new(secret_length)
  end

  def take_turn
    user_guess = @guesser.guess(@board)
    indices = @referee.check_guess(user_guess)
    p user_guess
    p indices
    update_board(user_guess, indices)
    @guesser.handle_response(user_guess)
  end

  def update_board(letter, indices)
    indices.each{|idx| @board[idx] = letter}
  end

end

class ComputerPlayer
  attr_reader :dictionary,
              :secret_word,
              :secret_length,
              :candidate_words,
              :alphabet

  def initialize(dictionary =
    File.readlines("dictionary.txt").map {|el| el.chomp})
    @dictionary = dictionary
    @alphabet = ('a'..'z').to_a
  end

  def pick_secret_word
    @secret_word = @dictionary.shuffle.first
    @secret_word.length
  end

  def check_guess(letter)
    if @secret_word.include?(letter)
      @secret_word.split("").each_index.select do |idx|
        @secret_word[idx] == letter
      end
    else
      []
    end
  end

  def register_secret_length(secret_length)
    @candidate_words = @dictionary.select{|el| el.length == secret_length}
    @secret_length = secret_length
  end

  def guess(board)
    p board
    user_guess = gets.chomp
    return no_guess(board) if user_guess.empty?
    user_guess
  end

  def handle_response(user_guess, indices)
    if indices.empty?
      @candidate_words.map!{|word| word if !word.include?(user_guess)}.compact!
    end
    puts "Letters are at positions:"
    indices.each{|el| puts el}
    @alphabet.delete(user_guess)
    @candidate_words = @candidate_words.each do |cand_word|
      indices.each do |idx|
        if cand_word[idx] != user_guess || cand_word.count(user_guess) != indices.length
          @candidate_words.delete(cand_word)
        end
      end
    end
  end

  def no_guess(board)
    hsh = Hash.new(0)
    @candidate_words.join.split("").each do |letter|
      if hsh[letter].nil?
        hsh[letter] = 1
      else
        hsh[letter] += 1
      end
    end
    hsh = hsh.sort_by{|k, v| v}
    if board.include?(hsh.last.first.to_s)
      return hsh[-2][0]
    else
      return hsh[-1][0]
    end
  end

end

class HumanPlayer

end
