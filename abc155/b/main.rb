N = gets.to_i
A = gets.split.map(&:to_i)
evens = A.select(&:even?)
filtered = evens.select { |a| a % 3 == 0 || a % 5 == 0 }
puts(evens.size == filtered.size ? 'APPROVED' : 'DENIED')