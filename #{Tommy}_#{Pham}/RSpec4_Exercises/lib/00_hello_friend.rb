class Friend
  def greeting(str = false)
    str ? "Hello, #{str}!": "Hello!"
  end
end
