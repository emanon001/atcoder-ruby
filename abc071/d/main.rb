N = gets.to_i
S1 = gets.chomp.chars
S2 = gets.chomp.chars
MOD = 10 ** 9 + 7
ans = 1
prev = nil
i = 0
while i < N
  if S1[i] == S2[i]
    # 2x1
    if prev.nil?
      ans = 3
    elsif prev == :v
      ans = ans * 2 % MOD
    else
      # do nothing
    end
    prev = :v
    i += 1
  else
    # 1x2
    if prev.nil?
      ans = 6
    elsif prev == :v
      ans = ans * 2 % MOD
    else
      ans = ans * 3 % MOD
    end
    prev = :h
    i += 2
  end
end
puts ans
