N = gets.to_i
as = gets.split.map(&:to_i)
bs = gets.split.map(&:to_i)

abs = as.zip(bs).map.with_index do |(a, b), i|
  [i, [a, b]]
end

def dfs(cond, acc)
  if cond.size == 0
    return [acc]
  end
  i, (a, b) = cond[0]
  dfs(cond.drop(1), acc + [[i, a]]) + dfs(cond.drop(1), acc + [[i, b]])
end

conds = dfs(abs, [])
sorted = conds.map do |cond|
  cond.sort_by { |_, x| x }
end
INF = 1 << 60
ans = INF
sorted.each do |l|
  index = 0
  is_ok = l.all? do |i, x|
    ret = false
    if as[i] == bs[i]
      ret = true
    else
      if (i - index).abs.odd?
        ret = x == bs[i]
      else
        ret = x == as[i]
      end
    end
    index += 1
    ret
  end
  next unless is_ok
  sum = 0
  index = 0
  l.each do |i, x|
    sum += (index - i).abs
    index += 1
  end
  next if sum.odd?
  ans = sum / 2 if sum / 2 < ans
end
if ans == INF
  puts -1
else
  puts ans
end