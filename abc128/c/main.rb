N, M = gets.split.map(&:to_i)
require 'set'
KS = M.times.map { Set.new(gets.split.drop(1).map(&:to_i)) }
P = gets.split.map(&:to_i)

ans = 0
(0...(1 << N)).each do |state|
  is_ok = M.times.all? do |k|
    set = KS[k]
    c = (1..N).count do |s|
      state[s - 1] == 1 && set.include?(s)
    end
    c % 2 == P[k]
  end
  ans += 1 if is_ok
end
puts ans