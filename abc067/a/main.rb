A, B = gets.split.map(&:to_i)
is_ok = [
  A,
  B,
  A + B
].any? { |n| n % 3 == 0 }
puts(is_ok ? 'Possible' : 'Impossible')
