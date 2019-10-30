N = gets.to_i
is_ok = (1..9).any? do |a|
  (1..9).any? do |b|
    a * b == N
  end
end
puts(is_ok ? 'Yes' : 'No')
