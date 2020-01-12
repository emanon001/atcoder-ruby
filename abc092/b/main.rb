N = gets.to_i
D, X = gets.split.map(&:to_i)
as = N.times.map { gets.to_i }
sum = 0
N.times do |i|
  a = as[i]
  sum += 1
  n = 1
  while n * a + 1 <= D
    sum += 1
    n += 1
  end
end
puts sum + X