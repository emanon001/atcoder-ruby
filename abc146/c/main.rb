def d(n)
  n.to_s.size
end

A, B, X = gets.split.map(&:to_i)

# a1 = X / A
# n1 = A * a1
# d1 = d(ans1)
# ans1 = n1 * A + d1 * B
# rest = X - ans1

# if rest >= 0
#   puts ans1
# else
#   diff = rest.abs
#   a2 = diff / A + (diff % A == 0 ? 0 : 1)
#   ans2 = if a1 - a2 >= 1
#     t = A * (a1 - a2)
#     t + d(t) * B
#   else
#     0
#   end
#   ans3 = ans1 + d(ans1) * B
#   b1 = diff / B + (diff % B == 0 ? 0 : 1)
#   ans2 = B * b1 + A * (10 ** b1)
#   if diff
# end

left = 1
right = X
ans = 0
while left <= right
  n = (left + right) / 2
  ret = n * A + d(n) * B
  if X >= ret
    ans = n
    left = n + 1
  else
    right = n - 1
  end
end
puts [ans, 1000000000].min
