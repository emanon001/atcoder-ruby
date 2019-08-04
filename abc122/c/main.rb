N, Q = gets.split.map(&:to_i)
S = gets.chomp.chars
lr_list = Q.times.map { gets.split.map(&:to_i) }
ac_count_list = Array.new(N)
count = 0
prev_ch = nil
S.each.with_index do |ch, i|
  count += prev_ch == 'A' && ch == 'C' ? 1 : 0
  prev_ch = ch
  ac_count_list[i] = count
end
lr_list.each do |(l, r)|
  l -= 1
  r -= 1
  ans = ac_count_list[r] - ac_count_list[l]
  puts ans
end
