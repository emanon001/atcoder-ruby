N = gets.to_i
d_sum = N.to_s.chars.map(&:to_i).reduce(&:+)
is_ok = N % d_sum == 0
puts(is_ok ? 'Yes' : 'No')
