M, D = gets.split.map(&:to_i)

def is_ok(m, d1, d10)
  d1 >= 2 && d10 >= 2 && d1 * d10 == m
end

ans = 0
(1..M).each do |m|
  (1..D).each do |d|
    d1 = d % 10
    d10 = d / 10
    ans += 1 if is_ok(m, d1, d10)
  end
end
puts ans
