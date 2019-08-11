N = gets.to_i
MOD = 10 ** 9 + 7
dp = Array.new(N + 1) { Hash.new { 0 } }
dp[0][''] = 1

def included_agc(cs)
  return false if cs.size <= 2
  return true if cs[-3..-1].join('') == 'AGC'
  (0..(cs.size - 2)).any? do |i|
    ts = cs.dup
    t = ts[i + 1]
    ts[i + 1] = ts[i]
    ts[i] = t
    ts.join('').include?('AGC')
  end
end

N.times do |i|
  dp[i].keys.each do |s|
    ss = s.chars
    %w[A C G T].each do |ch|
      new_ss = ss + [ch]
      unless included_agc(new_ss)
        new_s = if new_ss.size <= 2
          new_ss.join('')
        else
          new_ss[-3..-1].join('')
        end
        dp[i + 1][new_s] += dp[i][s] % MOD
      end
    end
  end
end
ans = dp[N].values.reduce(0) do |acc, n|
  (acc + n) % MOD
end
puts ans
