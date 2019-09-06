N, M = gets.split.map(&:to_i)
divisors = []
(1..(Math.sqrt(M).to_i)).each do |n|
  next unless M % n == 0
  divisors.push(n)
  divisors.push(M / n)
end
sorted = divisors.sort_by { |n| -n }
sorted.each do |d|
  if M / d >= N
    puts d
    exit 0
  end
end
