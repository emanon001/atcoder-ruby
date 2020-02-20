Q = gets.to_i
queries = Q.times.map { gets.split.map(&:to_i) }

require 'prime'
require 'set'
MAX = 10 ** 5
primes = Set.new(Prime.each(MAX).to_a)
cusum = Array.new(MAX + 1)
cusum[0] = 0
(1..MAX).each do |n|
  c = cusum[n - 1]
  c += 1 if primes.include?(n) && n.odd? && primes.include?((n + 1) / 2)
  cusum[n] = c
end
queries.each do |l, r|
  puts(cusum[r] - cusum[l - 1])
end