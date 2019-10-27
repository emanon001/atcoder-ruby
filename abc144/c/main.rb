# require 'prime'
# N = gets.to_i
# pd = N.prime_division
# ns = [1] + pd.flat_map { |n, e| [n] * e }.sort
# while ns.size > 2
#   a = ns.shift
#   b = ns.shift
#   c = a * b
#   ns = (ns + [c]).sort
# end

# x, y = ns
# ans = (x - 1) + (y - 1)
# puts ans

N = gets.to_i
ans = 1 << 60
(1..(Math.sqrt(N))).each do |n|
  if N % n == 0
    m = N / n
    step = (n - 1) + (m - 1)
    ans = step if step < ans
  end
end
puts ans
