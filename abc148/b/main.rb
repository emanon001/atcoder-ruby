N = gets.to_i
S, T = gets.chomp.split.map(&:chars)
puts S.zip(T).map { |a, b| a + b }.join('')
