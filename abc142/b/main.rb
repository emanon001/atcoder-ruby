N, K = gets.split.map(&:to_i)
hs = gets.split.map(&:to_i)
ans = hs.count { |h| h >= K }
puts ans
