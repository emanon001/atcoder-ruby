N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

def two_count(n)
  ret = 0
  while n % 2 == 0
    ret += 1
    n /= 2
  end
  ret
end

two_counts = A.map { |a| two_count(a) }
if two_counts.uniq.size != 1
  puts 0
  exit 0
end
first = A.reduce(1) do |acc, a|
  acc.lcm(a / 2)
end

rest = M - first
if rest >= 0
  ans = 1 + rest / (first * 2)
  puts ans
else
  puts 0
end