a, b = gets.split.map(&:to_i)
c = b - a
ans = (1..c).reduce(0, &:+) - b
puts ans
