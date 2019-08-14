N, K = gets.split.map(&:to_i)
S = gets.chomp.chars

def cumulative_sum(s)
  left = 0
  sums = []
  (s + ['-1']).each.with_index do |ch, i|
    if s[left] != ch
      sum = [s[left], sums.empty? ? 0 : sums[-1][2], i]
      sums.push(sum)
      left = i
    end
  end
  sums
end

sums = cumulative_sum(S)
ans = 0
sums.size.times do |i|
  ch, prev_sum, _ = sums[i]
  count =
    if ch == '0'
      left = i > 0 ? sums[i - 1][1] : 0
      right = sums[[i + (K - 1) * 2 + 1, sums.size - 1].min][2]
      right - left
    else
      left = prev_sum
      right = sums[[i + K * 2 - 1 + 1, sums.size - 1].min][2]
      right - left
    end
  ans = count if count > ans
end
puts ans
