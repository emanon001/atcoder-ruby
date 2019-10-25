N = gets.to_i
as = gets.split.map(&:to_i)

l = 0
r = 1
sum = as[l]
ans = as.size
while r < N
  if sum ^ as[r] == sum + as[r]
    ans += r - l
    sum = sum + as[r]
    r += 1
  else
    sum -= as[l]
    l += 1
  end
  if l == r
    sum = as[l]
    r += 1
  end
end
puts ans
