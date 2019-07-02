N, K = gets.split.map(&:to_i)
s_list = N.times.map { gets.to_i }

if s_list.include?(0)
  puts N
  exit
end

l = 0
r = 0
ans = 0
a = s_list[0]
while r < N
  size = r - l + 1
  if a <= K
    ans = size if size > ans
    r += 1
    a = a * s_list[r] if r < N
  else
    l += 1
    if l > r
      r = l
      a = s_list[l]
    else
      a = a / s_list[l - 1]
    end
  end
end
puts ans
