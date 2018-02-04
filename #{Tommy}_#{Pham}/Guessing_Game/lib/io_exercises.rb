# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  computer_guess = rand(1..100)
  guess_counter = 1
  user_guess = prompt_user.to_i
  while computer_guess != user_guess
    high_or_low(computer_guess, user_guess)
    user_guess = prompt_user.to_i
    guess_counter += 1
  end

  you_win(computer_guess, guess_counter)
end

def high_or_low(computer_guess, user_guess)
  puts "#{user_guess} is too low" if user_guess < computer_guess && user_guess != 0
  puts "#{user_guess} is too high" if user_guess > computer_guess
  if user_guess == 0
    puts "#{user_guess} is too low"
  end
end

def prompt_user
  puts "guess a number."
  gets.chomp
end

def you_win(computer_guess, guess_counter)
  puts "Computer number was: #{computer_guess}"
  puts "The amount of guess(es) you took was: #{guess_counter}"
end
