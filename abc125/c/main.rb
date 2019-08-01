N = gets.to_i
a_list = gets.split.map(&:to_i)

forward_gcd_list = Array.new(N)
gcd = nil
a_list.each.with_index do |a, i|
  gcd = gcd ? gcd.gcd(a) : a
  forward_gcd_list[i] = gcd
end

backward_gcd_list = Array.new(N)
gcd = nil
a_list.reverse.each.with_index do |a, i|
  gcd = gcd ? gcd.gcd(a) : a
  backward_gcd_list[N - 1 - i] = gcd
end

ans = N.times.map do |n|
  forward_gcd = n > 0 ? forward_gcd_list[n - 1] : nil
  backward_gcd = n < N - 1 ? backward_gcd_list[n + 1] : nil
  [forward_gcd, backward_gcd].compact.reduce { |acc, a| acc.gcd(a) }
end.max
puts ans
