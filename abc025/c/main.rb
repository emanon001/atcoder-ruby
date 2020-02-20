B = 2.times.map { gets.split.map(&:to_i) }
C = 3.times.map { gets.split.map(&:to_i) }

def score(board)
  r1 = 0
  r2 = 0
  2.times do |i|
    3.times do |j|
      if board[i][j] == board[i + 1][j]
        r1 += B[i][j]
      else
        r2 += B[i][j]
      end
    end
  end
  3.times do |i|
    2.times do |j|
      if board[i][j] == board[i][j + 1]
        r1 += C[i][j]
      else
        r2 += C[i][j]
      end
    end
  end
  [r1, r2]
end

def dfs(state, is_c_turn, turn_c, dp)
  return dp[state] if dp[state]
  if turn_c == 9
    return dp[state] = score(state)
  end
  r1 = -1
  r2 = -1
  3.times do |i|
    3.times do |j|
      if state[i][j].nil?
        new_s = state.map { |a| a.dup }
        new_s[i][j] = is_c_turn ? 0 : 1
        s1, s2 = dfs(new_s, !is_c_turn, turn_c + 1, dp)
        if is_c_turn && s1 > r1
          r1 = s1
          r2 = s2
        elsif !is_c_turn && s2 > r2
          r1 = s1
          r2 = s2
        end
      end
    end
  end
  dp[state] = [r1, r2]
end
state = Array.new(3) { Array.new(3) }
dp = {}
r1, r2 = dfs(state, true, 0, dp)
puts r1
puts r2