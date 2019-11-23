N = gets.to_i
candies = 2.times.map { gets.split.map(&:to_i) }

def dfs(candies, i, j, sum)
  c = candies[j][i]
  return sum + c if i == N - 1 && j == 1
  if i < N - 1 && j < 1
    [
      dfs(candies, i, j + 1, sum + c),
      dfs(candies, i + 1, j, sum + c)
    ].max
  elsif i == N - 1
    dfs(candies, i, j + 1, sum + c)
  else
    dfs(candies, i + 1, j, sum + c)
  end
end

ans = dfs(candies, 0, 0, 0)
puts ans
