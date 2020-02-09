S = gets.chomp.chars.map(&:to_i)

def dfs(nums, n, acc)
  return acc + n if nums.empty?
  rest = nums.drop(1)
  dfs(rest, nums[0], acc + n) \
    + dfs(rest, n * 10 + nums[0], acc)
end

puts dfs(S.drop(1), S[0], 0)