class Fixnum
  def in_words
    if !(self.to_s.match(/[1-9]/))
      return "zero"
    end
    string_arr = []
    split_num = self.Split_Into_Threes
    split_num.each {|el| string_arr << Identify_Group_Of_Threes(el)}
    Add_Placement(string_arr).compact.join(" ")
  end

  def Add_Placement(arr)
    arr.map.with_index do |el, idx|
      el = el + Index_To_Place(idx , arr) if !el.empty?
    end
  end

  def Index_To_Place(idx, arr)
    placement = arr.length - idx
    case placement
    when 5
      " trillion"
    when 4
      " billion"
    when 3
      " million"
    when 2
      " thousand"
    else
      ""
    end
  end

  def Identify_Group_Of_Threes(arr)
    x, y, z = arr[0].to_i, arr[1].to_i, arr[2].to_i

    if y > 0
      last_two = [y,z].join("").to_i
    else
      last_two = z.to_i
    end

    case last_two
    when 0
      HundredsDatabase(x)
    when 1..9
      x > 0 ? HundredsDatabase(x) + " " + OnesDatabase(last_two) : OnesDatabase(last_two)
    when 11..19
      x > 0 ? HundredsDatabase(x) + " " + TeensDatabase(last_two) : TeensDatabase(last_two)
    when 10..99
      if x > 0 && z > 0
        HundredsDatabase(x) + " " + TensDatabase(y*10) + " " + OnesDatabase(z)
      elsif x > 0 && z == 0
        HundredsDatabase(x) + " " + TensDatabase(y*10)
      elsif z == 0
        TensDatabase(y*10)
      else
        TensDatabase(y*10) + " " + OnesDatabase(z)
      end
    else
      ""
    end

  end

  def Split_Into_Threes
    working_arr = []
    holder_arr = []
    num_to_split_str = self.to_s.split("")

    until num_to_split_str.length % 3 == 0
      num_to_split_str.unshift("0")
    end

    num_to_split_str.each do |el|
      holder_arr << el
      if holder_arr.length == 3
        working_arr << holder_arr
        holder_arr = []
      end
    end

    working_arr
  end

  def OnesDatabase(num)
    case num
    when 0
      ""
    when 1
      "one"
    when 2
      "two"
    when 3
      "three"
    when 4
      "four"
    when 5
      "five"
    when 6
      "six"
    when 7
      "seven"
    when 8
      "eight"
    when 9
      "nine"
    end
  end

  def TeensDatabase(num)
    case num
    when 11
      "eleven"
    when 12
      "twelve"
    when 13
      "thirteen"
    when 15
      "fifteen"
    when 18
      "eighteen"
    when 14, 16, 17, 19
      OnesDatabase(num % 10) + "teen"
    end
  end

  def TensDatabase(num)
    case num
    when 10
      "ten"
    when 20
      "twenty"
    when 30
      "thirty"
    when 40
      "forty"
    when 50
      "fifty"
    when 80
      "eighty"
    when 60, 70, 90
      OnesDatabase(num.to_s.chars.first.to_i) + "ty"
    end
  end

  def HundredsDatabase(num)
    !num.zero? ? OnesDatabase(num) + " hundred" : ""
  end

  def ThousandsDatabase
    !num.zero? ? OnesDatabase(num) + " thousand" : ""
  end

  def MillionsDatabase
    !num.zero? ? OnesDatabase(num) + " million" : ""
  end

  def BillionsDatabase
    !num.zero? ? OnesDatabase(num) + " billion" : ""
  end

  def TrillionsDatabase
    !num.zero? ? OnesDatabase(num) + " trillion" : ""
  end

end
