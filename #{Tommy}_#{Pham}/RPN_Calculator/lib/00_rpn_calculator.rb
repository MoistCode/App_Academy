class RPNCalculator
  def initialize(arr = [])
    @arr = arr
  end

  def arr
    @arr
  end

  def arr_check
    if @arr.empty?
      raise "calculator is empty"
    end
  end

  def value
    @value[-1]
  end

  def push(int)
    @arr << int
  end

  def tokens(string)
    split_str = string.split(" ")
    split_str.delete("0")
    split_str.map! do |el|
      if el.to_i > 0
        el = el.to_i
      else
        el.to_sym
      end
    end
    split_str
  end

  def evaluate(string)
    tokenized_string = tokens(string)
    symbols = [:*, :/, :+, :-]
    holder = []
    while tokenized_string.length > 1
      tokenized_string.each_cons(3).with_index do |el, idx|

        if symbols.any? {|sym| sym == el[-1]}

          case el[-1]
          when :*
            holder << el[0] * el[1]
            dropped = tokenized_string.drop(idx + 3)
            holder << dropped
            tokenized_string = holder.flatten
            holder = []
            break
          when :/
            holder << el[0].to_f / el[1].to_f
            dropped = tokenized_string.drop(idx + 3)
            holder << dropped
            tokenized_string = holder.flatten
            holder = []
            break
          when :+
            holder << el[0] + el[1]
            dropped = tokenized_string.drop(idx + 3)
            holder << dropped
            tokenized_string = holder.flatten
            holder = []
            break
          when :-
            holder << el[0] - el[1]
            dropped = tokenized_string.drop(idx + 3)
            holder << dropped
            tokenized_string = holder.flatten
            holder = []
            break
          end

        else
          holder << el[0]
          holder = holder.flatten
          next
        end

      end
    end
    tokenized_string[0]
  end

  def exponent
    # a little bit tougher since it's right to left
  end

  def times
    arr_check
    holder = arr.pop(2)
    holder = holder.reduce(:*)
    arr.push(holder)
    @value = arr
    arr
  end

  def divide
    arr_check
    holder = arr.pop(2)
    holder = holder.map{|el| el.to_f}.reduce(:/)
    arr.push(holder)
    @value = arr
    arr
  end

  def plus
    arr_check
    holder = arr.pop(2)
    holder = holder.reduce(:+)
    arr.push(holder)
    @value = arr
    arr
  end

  def minus
    arr_check
    holder = arr.pop(2)
    holder = holder.reduce(:-)
    arr.push(holder)
    @value = arr
    arr
  end

end
