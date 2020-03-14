N = gets.to_i
ans = ['a' * N]
(1...N).each do |c|
  (1..(N - c)).each do |i|
    ret = ('a' * i) + ('b' * c) + ('a' * (N - (i + c)))
    ans.push(ret)
  end
end
ans.sort!
ans.each do |a|
  puts a
end