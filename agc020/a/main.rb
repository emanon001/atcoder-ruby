N, A, B = gets.split.map(&:to_i)
c = (A - B).abs
puts(c.even? ? 'Alice' : 'Borys')
