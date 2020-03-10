N = gets.to_i
R = gets.chomp.chars

MOD = 10 ** 4 + 7

def r_to_k(r)
  case r
  when 'J' then 0
  when 'O' then 1
  when 'I' then 2
  end
end

dp = Array.new(N + 1) { Array.new(1 << 3, 0) }
dp[0][1] = 1
N.times do |i|
  r = R[i]
  (1..7).each do |bits|
    next if dp[i][bits] == 0
    next_value = Array.new(1 << 3, 0)
    # 鍵を持つ人を選ぶ
    3.times do |key|
      next if bits[key] == 0
      # 次の日に参加する人を決める
      (1..7).each do |next_bits|
        next if next_bits[key] == 0
        next if next_bits[r_to_k(r)] == 0
        next_value[next_bits] = dp[i][bits] if next_value[next_bits] == 0
      end
    end
    (1..7).each do |next_bits|
      count = next_value[next_bits]
      dp[i + 1][next_bits] = (dp[i + 1][next_bits] + count) % MOD
    end
  end
end
puts dp[N].reduce(&:+) % MOD