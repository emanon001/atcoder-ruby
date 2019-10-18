require 'prime'
require 'set'
Q = gets.to_i
queries = Q.times.map { gets.split.map(&:to_i) }

MAX = 10 ** 5
primes = Set.new(Prime.each(MAX).to_a)

list = Array.new(MAX + 1)
count = 0
list[0] = count
(1..MAX).each do |n|
  if n.even?
    list[n] = count
    next
  end
  count += 1 if primes.include?(n) && primes.include?((n + 1) / 2)
  list[n] = count
end

queries.each do |l, r|
  puts list[r] - list[l - 1]
end
