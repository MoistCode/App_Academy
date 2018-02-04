# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  return str.gsub(/[a-z]/, "")
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  half = str.length / 2
  return str.length.odd? ? str[half] : str[half - 1] + str[half]
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
  counter = 0
  str.each_char {|el| counter += 1 if el.match(/[aeiou]/)}
  return counter
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  product = 1
  (1..num).each{|el| product *= el}
  return product
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  new_str = ""
  arr.each{|el| new_str << el + separator}
  return separator == "" ? new_str : new_str[0...-1]
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  str.chars.each_with_index.map do |el, idx|
    idx.even? ? str[idx] = el.downcase : str[idx] = el.upcase
  end
  return str
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  final_str = str.split(" ").each.map do |el|
    el.length >= 5 ? el = el.reverse : el = el
  end
  return final_str.join(" ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  (1..n).to_a.each.map do |el|
    el % 3 == 0 && !(el % 5 == 0) ? el = "fizz" : el = el
    el % 5 == 0 && !(el % 3 == 0) ? el = "buzz" : el = el
    el % 3 == 0 && el % 5 == 0 ? el = "fizzbuzz" : el = el
  end
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  return arr.reverse
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  counter = 0
  (1..num).each {|el| counter += 1 if num % el == 0}
  counter == 2 ? true : false
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  final_arr = []
  (1..num).each {|el| final_arr << el if num % el == 0}
  return final_arr
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  return factors(num).each.map {|el| el if prime?(el)}.compact
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  return prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  odd_count, even_count = 0, 0
  arr.each {|el| el.odd? ? odd_count += 1 : even_count += 1}
  odd_count > even_count ? arr.each{|el| return el if el.even?} : arr.each {|el| return el if el.odd?}
end
