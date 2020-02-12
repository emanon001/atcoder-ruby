N = gets.to_i
W = N.times.map { gets.to_i }

INF = 1 << 60
d_list = Array.new(N, INF)
W.each do |w|
  i = d_list.bsearch_index do |d|
    d >= w
  end
  d_list[i] = w
end
ans = d_list.count { |d| d != INF }
puts ans