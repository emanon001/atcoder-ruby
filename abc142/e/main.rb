require 'set'
N, M = gets.split.map(&:to_i)
as = Array.new(N)
keys = Array.new(N) { [] }
key_to_ts = Array.new(M) { [] }
ts = Set.new
M.times do |k|
  a, _ = gets.split.map(&:to_i)
  as[k] = a
  gets.split.map(&:to_i).each do |t|
    t -= 1
    keys[t].push(k)
    key_to_ts[k].push(t)
    ts.add(t)
  end
end
if ts.size < N
  puts -1
  exit 0
end

def dfs(ts, as, keys, key_to_ts, sum)
  return sum if ts.empty?
  min = 1 << 60
  t = ts[0]
  keys[t].each do |k|
    a = as[k]
    new_sum = sum + a
    new_ts = ts.dup
    key_to_ts[k].each do |t2|
      new_ts.delete(t2)
    end
    n = dfs(new_ts, as, keys, key_to_ts, new_sum)
    min = n if n < min
  end
  min
end

ans = dfs((0...N).to_a, as, keys, key_to_ts, 0)
puts ans
