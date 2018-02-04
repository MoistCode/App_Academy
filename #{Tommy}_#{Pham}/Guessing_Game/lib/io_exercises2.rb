def file_shuffler
  file_name = asks_for_file_name
  shuffled_file = File.readlines(file_name).shuffle
  new_file = File.new("./{#{file_name}}-shuffled.txt","w")
  shuffled_file.each {|line| new_file.puts line}
end

def asks_for_file_name
  puts "Current Directory: " + Dir.pwd.to_s
  puts "Please type in the file name in this directory:"
  user_dir = gets.chomp
end

file_shuffler
