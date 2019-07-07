N = gets.to_i
a_list = gets.split.map(&:to_i)

ans = 0
(0..a_list[0]).each do |n|
  prev = n
  is_ok = (1...N).all? do |i|
    a = a_list[i]
    b = a - prev
    prev = b
    if i == N - 1
      b == n
    else
      b > 0
    end
  end
  if is_ok
    ans = n
    break
  end
end
result = a_list.map do |a|
  ret = ans * 2
  ans = a - ans
  ret
end
puts result.join(' ')
