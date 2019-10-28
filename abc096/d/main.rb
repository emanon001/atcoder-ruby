require 'prime'
N = gets.to_i
primes = Prime.each(55555).to_a

ans = primes.select do |prime|
  prime % 5 == 1
end.take(N)
puts ans.join(' ')
