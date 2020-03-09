N, M = gets.split.map(&:to_i)
graph = Array.new(N) { [] }
M.times do
  s, t, d, time = gets.split.map(&:to_i)
  s -= 1
  t -= 1
  graph[s].push([t, d, time])
  graph[t].push([s, d, time])
end

INF = 1 << 60
FIN = (1 << N) - 1

if N == 1
  puts '0 1'
  exit 0
end

def solve(start, graph)
  t_dp = Array.new(1 << N) { Array.new(N, INF) }
  t_dp[0][start] = 0
  c_dp = Array.new(1 << N) { Array.new(N, 0) }
  c_dp[0][start] = 1
  # time, s, u
  queue = [[0, 0, start]]
  while !queue.empty?
    time, s, u = queue.shift
    next if time > t_dp[s][u]
    graph[u].each do |v, d, t|
      next if s[v] == 1
      new_s = s | (1 << v)
      new_time = time + d
      next if new_time > t_dp[new_s][v]
      next if new_time > t
      if new_time < t_dp[new_s][v]
        t_dp[new_s][v] = new_time
        c_dp[new_s][v] = c_dp[s][u]
        queue.push([new_time, new_s, v])
      else
        c_dp[new_s][v] += c_dp[s][u]
      end
    end
  end
  [t_dp, c_dp]
end

t_dp, c_dp = solve(0, graph)
if c_dp[FIN][0] == 0
  puts 'IMPOSSIBLE'
else
  puts "#{t_dp[FIN][0]} #{c_dp[FIN][0]}"
end