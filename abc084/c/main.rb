N = gets.to_i
csfs = (N - 1).times.map { gets.split.map(&:to_i) }
csfs.each.with_index do |(c, s, _), i|
  ans = s + c
  ((i + 1)...(csfs.size)).each do |j|
    c, s, f = csfs[j]
    if s > ans
      ans = s + c
    elsif (ans - s) % f == 0
      ans += c
    else
      ans += (f - ((ans - s) % f)) + c
    end
  end
  puts ans
end
puts 0
