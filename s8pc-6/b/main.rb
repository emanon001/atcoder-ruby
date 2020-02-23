N = gets.to_i
AB = N.times.map { gets.split.map(&:to_i) }

start = AB.sort_by { |a, _| a }[N / 2][0]
goal = AB.sort_by { |_, b| b }[N / 2][1]
ans = 0
AB.each do |a, b|
  ans += (start - a).abs + (b - a) + (goal - b).abs
end
puts ans