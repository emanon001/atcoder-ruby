N, M = gets.split.map(&:to_i)
INF = 1 << 60
d = Array.new(N) { Array.new(N, INF) }
N.times { |i| d[i][i] = 0 }
M.times do
  u, v, c = gets.split.map(&:to_i)
  u -= 1
  v -= 1
  d[u][v] = c
  d[v][u] = c
end

def warshal_floyd(d)
  v = d.size
  v.times do |k|
    v.times do |i|
      v.times do |j|
        cost = d[i][j]
        new_cost = d[i][k] + d[k][j]
        d[i][j] = new_cost if new_cost < cost 
      end
    end
  end
end

warshal_floyd(d)
ans = INF
d.each do |a|
  max = a.max
  ans = max if max < ans
end
puts ans