N, K, S = gets.split.map(&:to_i)
ans = []
if K == 0
  a = S == 1 ? S + 1 : S - 1
  puts ([a] * N).join(' ')
  exit 0
end
ans = ([S] * K)
ans = ans + ([(S == 1 ? S + 1 : S - 1)] * (N - K)) if N - K > 0
puts ans.join(' ')