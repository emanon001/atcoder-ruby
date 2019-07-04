N = gets.to_i
boss_list = (N - 1).times.map { gets.to_i }
buka_table = {}
boss_list.each.with_index do |boss, i|
  buka_table[boss] ||= []
  buka_table[boss].push(i + 2)
end
INF = 2 << 60

def dfs(id, buka_table)
  return 1 unless buka_table[id]
  max = -INF
  min = INF
  buka_table[id].each do |bid|
    n = dfs(bid, buka_table)
    max = n if n > max
    min = n if n < min
  end
  max + min + 1
end
puts dfs(1, buka_table)
