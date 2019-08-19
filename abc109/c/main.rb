N, X = gets.split.map(&:to_i)
xs = gets.split.map(&:to_i)
ds = xs.map { |x| (x - X).abs }
ans = ds.reduce { |acc, d| acc.gcd(d) }
puts ans
