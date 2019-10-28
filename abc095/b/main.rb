N, X = gets.split.map(&:to_i)
ms = N.times.map { gets.to_i }
min = ms.min
rest = X - ms.reduce(&:+)
ans = N + (rest / min)
puts ans
