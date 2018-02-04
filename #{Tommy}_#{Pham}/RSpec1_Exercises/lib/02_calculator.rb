def add(*rest)
  return rest.reduce(:+)
end

def subtract(x, y)
  return x.to_i - y.to_i
end

def sum(rest)
  rest.empty? ? 0 : rest.reduce(:+)
end

def multiply(*rest)
  return rest.reduce(:*)
end

def power(x, y)
  return x**y
end

def factorials(x)
  arr = []
  if x != 0
    (1..x).each{|el| arr << el if x % el == 0}
  else
    return [0]
  end
  return arr
end
