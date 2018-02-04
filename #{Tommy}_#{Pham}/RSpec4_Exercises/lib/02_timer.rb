class Timer
  attr_accessor :hours, :minutes, :seconds

  def initialize(hours = 0, minutes = 0, seconds = 0)
    @hours = hours
    @minutes = minutes
    @seconds = seconds
  end

  def conversion
    @minutes += @seconds / 60
    @seconds = @seconds % 60
    @hours += @minutes / 60
    @minutes = @minutes % 60
  end

  def time_to_s(input)
    if input.to_s.length < 2
      return "0#{input}"
    else
      return "#{input}"
    end
  end

  def time_string
    conversion
    "#{time_to_s(hours)}:#{time_to_s(minutes)}:#{time_to_s(seconds)}"
  end

end
