H1, W1 = gets.split.map(&:to_i)
H2, W2 = gets.split.map(&:to_i)
is_ok = H1 == H2 || H1 == W2 || W1 == W2 || W1 == H2
puts(is_ok ? 'YES' : 'NO')
