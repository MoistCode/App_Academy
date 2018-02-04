require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
  return arr.empty? ? 0 : arr.reduce(:+)
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def in_all_strings?(long_strings, substring)
  return long_strings.all? {|el| el.match(/#{substring}/)}
end

# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
  arr = []
  string.chars.uniq.each {|el| arr << el if string.count(el) > 1 && el != " "}
  return arr.compact
end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
  hsh = {}
  final_arr = []
  string.gsub(/[,.?!']/, "").split(" ").each do |el|
    hsh["#{el}"] = el.length if hsh.values.all?{|v| v != el.length}
  end
  final_arr << hsh.sort_by{|k, v| v}[-1][0]
  final_arr << hsh.sort_by{|k, v| v}[-2][0]
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
  return ("a".."z").to_a - string.split("")
end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
  final_arr = []
  (first_yr..last_yr).each do |el|
    final_arr << el if not_repeat_year?(el)
  end
  return final_arr
end

def not_repeat_year?(year)
  return year.to_s.split("").uniq == year.to_s.split("")
end

# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
  final_arr = []
  songs.each_with_index.reduce(1) do |acc, (el, idx)|
    acc += 1 if el == songs[idx-1]
    final_arr << el if acc >= 2
    acc = 1
  end
  return (songs - final_arr).uniq
end

def no_repeats?(song_name, songs)
end

# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)
  hsh = {}
  string.gsub(/[,.?'!]/, "").split(" ").each do |el|
    hsh["#{el}"] = c_distance(el) if hsh.values.none?{|v| v == c_distance(el)}
  end
  return hsh.compact.sort_by{|k,v| v}[0][0]
end

def c_distance(word)
  word.index('c').nil? ? nil : word.length - (word.length - word.split("").reverse.index('c'))
end

# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]

def repeated_number_ranges(arr)
  working_arr = []
  final_arr = []
  arr.each_with_index do |el, idx|
    working_arr << idx if el == arr[idx + 1] && el != arr[idx - 1]
    working_arr << idx if el != arr[idx + 1] && el == arr[idx - 1]
  end
  working_arr.each_with_index do |el, idx|
    return final_arr if idx * 2 == working_arr.length
    final_arr << [working_arr[idx*2], working_arr[(idx*2) + 1]]
  end
end
