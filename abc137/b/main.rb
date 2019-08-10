K, X = gets.split.map(&:to_i)
min = [X - K + 1, -1000000].max
max = [X + K - 1, 1000000].min
puts (min..max).to_a.join(' ')
