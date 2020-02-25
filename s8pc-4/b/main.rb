N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

ans = 1 << 60
(0...(1 << N)).each do |bits|
  sum = 0
  max = 0
  count = 0
  A.each.with_index do |a, i|
    if a > max
      max = a
      count += 1
    elsif bits[i] == 1
      sum = sum + (max - a) + 1
      max = max + 1
      count += 1
    end
    break if count == K
  end
  if count == K
    ans = sum if sum < ans
  end
end
puts ans