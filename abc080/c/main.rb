N = gets.to_i
fs = N.times.map { gets.split.map(&:to_i) }
ps = N.times.map { gets.split.map(&:to_i) }

ans = -(1 << 60)
(1...(1 << 10)).each do |b|
  sum = 0
  fs.each.with_index do |f, i|
    c = 0
    f.each.with_index do |n, j|
      c += 1 if n == 1 && b[j] == 1
    end
    sum += ps[i][c]
  end
  ans = sum if sum > ans
end
puts ans
