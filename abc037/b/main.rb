N, Q = gets.split.map(&:to_i)
lrt_list = Q.times.map { gets.split.map(&:to_i) }
list = Array.new(N) { 0 }
lrt_list.each do |(l, r, t)|
  (l..r).each do |i|
    list[i - 1] = t
  end
end
list.each do |v|
  puts v
end
