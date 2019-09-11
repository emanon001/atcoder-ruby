N, X = gets.split.map(&:to_i)
ans = 0

size_table = Array.new(N + 1)
size_table[0] = 1
(1..N).each do |n|
  size_table[n] = 3 + size_table[n - 1] * 2
end

def dfs(n, i, size_table)
  return 1 if n == 0
  return 0 if i < n
  size = size_table[n]
  return 2 ** (n + 1) - 1 if i >= size - n - 1
  if i == (size - 1) / 2
    # center
    1 + dfs(n - 1, size_table[n - 1] - 1, size_table)
  elsif i < (size - 1) / 2
    # left
    dfs(n - 1, i - 1, size_table)
  else
    # right
    dfs(n - 1, size_table[n - 1] - 1, size_table) + \
      1 + \
      dfs(n - 1, i - 2 - size_table[n - 1], size_table)
  end
end

ans = dfs(N, X - 1, size_table)
puts ans
