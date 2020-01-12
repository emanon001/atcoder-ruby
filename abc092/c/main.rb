N = gets.to_i
A = gets.split.map(&:to_i)
sum = 0
prev = 0
A.each do |a|
  sum += (prev - a).abs
  prev = a
end
sum += A[-1].abs

N.times do |i|
  prev_pos = if i == 0
    0
  else
    A[i - 1]
  end
  next_pos = if i == N - 1
    0
  else
    A[i + 1]
  end 
  diff = (prev_pos - A[i]).abs + (A[i] - next_pos).abs - (prev_pos - next_pos).abs
  puts sum - diff
end