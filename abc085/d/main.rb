N, H = gets.split.map(&:to_i)
list = Array.new(N * 2)
N.times.each do |i|
  a, b = gets.split.map(&:to_i)
  list[i * 2] = [:a, a, b]
  list[i * 2 + 1] = [:b, b, a]
end
sorted = list.sort_by { |(_, n, _)| -n }
sum = 0
sorted.each.with_index do |(t, n, m), i|
  if t == :b
    sum += n
    if sum >= H
      puts i + 1
      exit 0
    end
  else
    b_count = i
    rest = H - sum
    ans = b_count + (rest + (n - 1)) / n
    puts ans
    exit 0
  end
end
