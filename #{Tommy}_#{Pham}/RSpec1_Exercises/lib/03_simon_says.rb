def echo(string)
  return string
end

def shout(string)
  return string.upcase
end

def repeat(string, x = 2)
  working_str = string
  (x-1).times do
    working_str += " #{string}"
  end
  working_str
end

def start_of_word(string, x)
  string.chars.each_cons(x) do |el|
    return el.join
  end
end

def first_word(string)
  return string.split(" ")[0]
end

def titleize(string)
  arr = []
  string.split(" ").map!.with_index do |el, idx|
     if el.length > 4 || idx == 0 || idx == string.split(" ").length - 1
       arr << el.capitalize
     else
       arr << el
     end
  end
  return arr.join(" ")
end
