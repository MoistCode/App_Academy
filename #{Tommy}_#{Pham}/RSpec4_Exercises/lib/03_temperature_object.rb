module Conversion

  def f_to_c(fahrenheit)
    (fahrenheit - 32) * (5/9.0)
  end

  def c_to_f(celsius)
    (celsius * (9/5.0)) + 32
  end

  def in_celsius
    if self.class == Fahrenheit
      return f_to_c(self.input)
    end
    self.input
  end

  def in_fahrenheit
    if self.class == Celsius
      return c_to_f(self.input)
    end
    self.input
  end

end

class Temperature
  attr_reader :temp_value, :temp_key
  include Conversion

  def initialize(hsh = {})
    hsh = hsh.reduce
    @temp_key = hsh.first
    @temp_value = hsh.last
  end

  def in_celsius
    if self.class == Temperature
      case @temp_key
      when :f then f_to_c(@temp_value)
      when :c then @temp_value
      end
    else
      super
    end
  end

  def in_fahrenheit
    if self.class == Temperature
      case @temp_key
      when :f then @temp_value
      when :c then c_to_f(@temp_value)
      end
    else
      super
    end
  end

  def self.from_celsius(input)
    my_celsius = Celsius.new(input)
  end

  def self.from_fahrenheit(input)
    my_fahrenheit = Fahrenheit.new(input)
  end
end

class Celsius < Temperature
  attr_reader :input

  def initialize(input = 0)
    @input = input
  end

end

class Fahrenheit < Temperature
  attr_reader :input

  def initialize(input = 0)
    @input = input
  end

end
