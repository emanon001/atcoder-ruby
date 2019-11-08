N, C = gets.split.map(&:to_i)
xvs = N.times.map { gets.split.map(&:to_i) }

# 右回り(時計回り)
r_maxes = Array.new(N)
current = 0
(0...N).each do |i|
  x, v = xvs[i]
  if i == 0
    current = v - x
    r_maxes[i] = current
  else
    px = xvs[i - 1][0]
    current = current - (x - px) + v
    r_maxes[i] = [
      current,
      r_maxes[i - 1]
    ].max
  end
end

# 左回り(反時計回り)
l_maxes = Array.new(N)
current = 0
(0...N).each do |i|
  pos = N - i - 1
  x, v = xvs[pos]
  if pos == N - 1
    current = v - (C - x)
    l_maxes[i] = current
  else
    px = xvs[pos + 1][0]
    current = current - (px - x) + v
    l_maxes[i] = [
      current,
      l_maxes[i - 1]
    ].max
  end
end

ans = 0
(0..N).each do |r_count|
  l_count = N - r_count
  r_max = r_count > 0 ? r_maxes[r_count - 1] : 0
  l_max = l_count > 0 ? l_maxes[l_count - 1] : 0
  sum = r_max + l_max
  sum -= if r_count == 0 || l_count == 0
    0
  else
    r_distance = xvs[r_count - 1][0]
    l_distance = C - xvs[N - l_count][0]
    [r_distance, l_distance].min
  end
  ans = sum if sum > ans
end
puts ans
