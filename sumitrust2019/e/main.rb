require 'set'
N = gets.to_i
as = gets.split.map(&:to_i)
MOD = 10 ** 9 + 7
set1 = Set.new
set2 = Set.new
set3 = Set.new
ans = 1
as.each do |n|
  count = 0
  if (n == 0 && !set1.include?(n)) || (!set1.include?(n) && set1.include?(n - 1))
    set1.add(n)
    count += 1
  end
  if (n == 0 && !set2.include?(n)) || (!set2.include?(n) && set2.include?(n - 1))
    set2.add(n) if count == 0
    count += 1
  end
  if (n == 0 && !set3.include?(n)) || (!set3.include?(n) && set3.include?(n - 1))
    set3.add(n) if count == 0
    count += 1
  end
  ans = ans * count % MOD
end
puts ans
