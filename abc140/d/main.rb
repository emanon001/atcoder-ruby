N, K = gets.split.map(&:to_i)
S = gets.chomp.chars
n = 0
ok_count = 0
prev = nil
S.each do |ch|
  if ch == prev
    ok_count += 1
  else
    n += 1
  end
  prev = ch
end
diff = [n - 1, K * 2].min
ans = ok_count + diff
puts ans
