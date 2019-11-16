N = gets.to_i
S = gets.chomp.chars

ans = Array.new(N)
[
  ['S', 'S'],
  ['S', 'W'],
  ['W', 'S'],
  ['W', 'W']
].each do |(a0, a1)|
  ans[0] = a0
  ans[1] = a1
  (1...(N - 1)).each do |i|
    a = ans[i]
    if a == 'S'
      ans[i + 1] = if S[i] == 'o'
        ans[i - 1]
      else
        ans[i - 1] == 'S' ? 'W' : 'S'
      end
    else # W
      ans[i + 1] = if S[i] == 'o'
        ans[i - 1] == 'S' ? 'W' : 'S'
      else
        ans[i - 1]
      end
    end
  end
  is_ok = true
  is_ok = false if ans[-1] == 'S' && S[-1] == 'o' && ans[-2] != ans[0]
  is_ok = false if ans[-1] == 'S' && S[-1] == 'x' && ans[-2] == ans[0]
  is_ok = false if ans[-1] == 'W' && S[-1] == 'o' && ans[-2] == ans[0]
  is_ok = false if ans[-1] == 'W' && S[-1] == 'x' && ans[-2] != ans[0]
  is_ok = false if ans[0] == 'S' && S[0] == 'o' && ans[-1] != ans[1]
  is_ok = false if ans[0] == 'S' && S[0] == 'x' && ans[-1] == ans[1]
  is_ok = false if ans[0] == 'W' && S[0] == 'o' && ans[-1] == ans[1]
  is_ok = false if ans[0] == 'W' && S[0] == 'x' && ans[-1] != ans[1]
  if is_ok
    puts ans.join('')
    exit 0
  end
end

puts '-1'
