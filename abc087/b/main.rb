A = gets.to_i
B = gets.to_i
C = gets.to_i
X = gets.to_i

ans = 0
(0..A).each do |c500|
  (0..B).each do |c100|
    (0..C).each do |c50|
      ans += 1 if 500 * c500 + 100 * c100 + 50 * c50 == X
    end
  end
end
puts ans
