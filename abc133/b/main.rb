N, D = gets.split.map(&:to_i)
list = N.times.map { gets.split.map(&:to_i) }
count = 0
N.times do |i|
  ((i + 1)..(N - 1)).each do |j|
    n = list[i].zip(list[j]).map do |(a, b)|
      (a - b) ** 2
    end.reduce(&:+)
    m = Math.sqrt(n)
    count += 1 if m == m.to_i
  end
end
puts count
