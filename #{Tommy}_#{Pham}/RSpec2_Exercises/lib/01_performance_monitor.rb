def measure(x = 1, &prc)
  final_time = 0
  x.times do
    start = Time.now
    prc.call
    finish = Time.now
    final_time += finish - start
  end
  return final_time / x
end
