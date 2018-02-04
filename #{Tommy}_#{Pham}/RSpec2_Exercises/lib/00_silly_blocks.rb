def reverser(&prc)
  return prc.call.split(" ").map {|el| el.reverse}.join(" ")
end

def adder(x=1, &prc)
  return prc.call + x
end

def repeater(x = 1, &prc)
  block_given? ? x.times {prc.call} : false
end
