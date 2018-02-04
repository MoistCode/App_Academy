def translate(string)
  split_str = string.split(" ")
  split_str.map! do |el|
    letters = el.split("")
    num = 0
    letters.each_with_index do |ltr, idx|
      if ltr.match("q") && letters[idx+1].match("u")
        num = idx + 2
        break
      elsif ltr.match(/[aeiouAEIOU]/)
        num = idx
        break
      else
        next
      end
    end
    holder = letters.shift(num) << "ay"
    letters << holder
    letters.join
  end
  return split_str.join(" ")
end
