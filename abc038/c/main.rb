N = gets.to_i
a_list = gets.split.map(&:to_i)
l = 0
r = 0
count = 0
while l < N
  while r < N - 1 && a_list[r] < a_list[r + 1]
    r += 1
  end
  n = r - l + 1
  count += n
  l += 1
  r = l if r < l
end
puts count
